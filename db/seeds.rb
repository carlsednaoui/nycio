# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin Users

user1 = User.create(name: "Carl Sednaoui",
			email: "carl@thinkful.com",
			password: "nyciopassword")
user1.add_role "admin"

user2 = User.create(name: "Victor Miclovich",
			email: "vmiclovich@thinkful.com",
			password: "nyciopassword")
user2.add_role "admin"

user3 = User.create(name: "Matt Star",
			email: "mstar@thinkful.com",
			password: "nyciopassword")
user3.add_role "admin"


# Organizations

org = Organization.create(name: "Test Organization",
						  description: "What a mighty fine test organization.")


# Organization Manager

user1.add_role "manager", org


# Event

event = Event.create(name: "Test Event",
					 description: "GONNA TEACH SOME KIDS TO CODE at this lovely event!!!",
					 organization: org)


# Skills

skill = Skill.create(name: "HTML")
skill2 = Skill.create(name: "Ruby on Rails")


# Event Skills

EventSkill.create(skill: skill, event: event)
EventSkill.create(skill: skill2, event: event)


# Occurrence

Occurrence.create(event: event,
				  start_time: (DateTime.now + 30.days),
				  end_time: (DateTime.now + 30.days + 3.hours))