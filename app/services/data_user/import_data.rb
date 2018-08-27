
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
					a = User.new(email: email, name: name, password: password )
					a.skip_confirmation!
					a.save
				end
			end
		end
	end
end