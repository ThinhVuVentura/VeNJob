
module DataUser
	class ImportData
		def import(file)
			require 'csv'
			CSV.foreach(file.path, headers: true) do |row|
				user = row.to_hash
				name = user["Name"]
				email = user["Email"]
				password = user["Password"]
				if User.where("users.email = ?",email).count == 1
					User.find_by(email: email).update!(name: name, password: password)
				else
					User.create!(email: email, name: name, password: password )
				end
			end
		end
	end
end