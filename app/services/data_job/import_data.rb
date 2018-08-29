
require "zip"
require 'csv'
require "net/ftp"
module DataJob
	class ImportData

		def import_job
			# download file
			ftp = Net::FTP.new
			ftp.connect("192.168.1.156")
			ftp.login("training","training")
			files = ftp.list('*')
			path = Rails.root + "public/system/jobs.zip"
			ftp.getbinaryfile("jobs.zip", path)

			# extract
			Zip::File.open(path) { |zip_file|
		    zip_file.each { |f|
		     f_path=File.join(Rails.root + "public/system/", f.name)
		     	FileUtils.mkdir_p(File.dirname(f_path))
		     	zip_file.extract(f, f_path) unless File.exist?(f_path)
		   }
		  }

		  #import
		  CSV.foreach(File.join(Rails.root + "public/system/jobs.csv"), headers: true) do |row|
				job = row.to_hash

				description = job["benefit"]
				industry = job["category"]
				company = job["company name"]
				city = job["company province"]
				price = job["salary"]
				 jobtitle = job["description"]
				if city.blank?
					city = "Hà Nội"
				end

				if City.where("cities.name = ?",city).count != 1
					 City.create!(name: city)
				end

				if Industry.where("industries.title = ?",industry).count != 1
					Industry.create!(title: industry)
				end

				if Job.where("jobs.name = ? AND jobs.company = ?",jobtitle, company).count == 1 && Job.joins(:city).where("cities.name = ?", city)
					Job.update(name: jobtitle, price: price , description: description, company: company)
				else
					Job.create!(name: jobtitle, price: price , description: description, company: company, industry_id: Industry.find_by(title: industry).id , city_id: City.find_by(name: city).id)
				end
			 end
		end
	end
end