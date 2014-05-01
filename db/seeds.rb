# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(email: "carl@thinkful.com",
			password: "nyciopassword")
user1.add_role "admin"

user2 = User.create(email: "vmiclovich@thinkful.com",
			password: "nyciopassword")
user2.add_role "admin"

user3 = User.create(email: "mstar@thinkful.com",
			password: "nyciopassword")
user3.add_role "admin"
