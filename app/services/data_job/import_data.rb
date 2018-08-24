require 'csv'
module DataJob
	class ImportData
		def import(file)
			CSV.foreach(file.path, headers: true) do |row|
				Job.create! row.to_hash
			end
		end
	end
end