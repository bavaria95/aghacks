# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(email: "admin@admin.pl", password: "admin", role: 1)
user = User.create(email: "user@user.pl", password: "user", role: 2)
user2 = User.create(email: "user2@user.pl", password: "user", role: 2)
user3 = User.create(email: "user3@user.pl", password: "user", role: 2)
user4 = User.create(email: "user4@user.pl", password: "user", role: 2)
user5 = User.create(email: "user5@user.pl", password: "user", role: 2)

