# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(username: "Twoj Admin", email: "admin@admin.pl", password: "haslo1234", role: 2)
admin.skills << Skill.create(skill: "Ruby") << Skill.create(skill: "GIT") << Skill.create(skill: "Angular.JS")

