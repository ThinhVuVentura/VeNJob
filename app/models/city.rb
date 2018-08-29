class City < ApplicationRecord
has_many :industries, :dependent => :delete_all
enum city_list:{"viet nam":0, "international":1 }

	def self.filter(args={})
    cities = all
    cities = cities.where(city_list: args[:city_list]) if args[:city_list].present?
    cities
  end
end