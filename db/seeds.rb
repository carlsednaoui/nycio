# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin Users

user1 = User.create(first_name: "Carl",
			last_name: "Sednaoui",
			email: "carl@thinkful.com",
			password: "nyciopassword")
user1.add_role "admin"

user2 = User.create(first_name: "Victor",
			last_name: "Miclovich",
			email: "vmiclovich@thinkful.com",
			password: "nyciopassword")
user2.add_role "admin"

user3 = User.create(first_name: "Matt",
			last_name: "Star",
			email: "mstar@thinkful.com",
			password: "nyciopassword")
user3.add_role "admin"


# Volunteers

volunteer_list = [
  ["Test", "Guy", "test@example.com", "password"],
  ["Joe", "Somebody", "joe@example.com", "password"]
]

volunteer_list.each do |first_name, last_name, email, password|
	User.create(first_name: first_name, 
				last_name: last_name, 
				email: email, 
				password: password)
end


# Organizations

organization_list = [
  [ "Coder Dojo", "It's a dojo, and you code!" ],
  [ "Great Organization", "The greatest of great organizations" ],
  [ "Fun Organization", "This organization is SO fun" ],
  [ "The Best Organization", "It's not the greatest, it's the best organization!" ]
]

organization_list.each do |name, description|
	each_org = Organization.create(name: name, description: description)
	UserOrganization.create(user_id: user3.id, organization_id: each_org.id, manager: true)
end

org = Organization.create(name: "Test Organization",
						  description: "What a mighty fine test organization.",
						  approved: true)

org2 = Organization.create(name: "Other Organization",
						  description: "This is the other one.",
						  approved: true)


# UserOrganization

UserOrganization.create(user_id: user1.id, organization_id: org.id, manager: true)
UserOrganization.create(user_id: user2.id, organization_id: org.id)
UserOrganization.create(user_id: User.last.id, organization_id: org.id)
UserOrganization.create(user_id: User.last.id, organization_id: org2.id, manager: true)


# Event

event = Event.create(name: "Test Event",
					 description: "GONNA TEACH SOME KIDS TO CODE at this lovely event!!!",
					 organization: org)

event2 = Event.create(name: "Test Event 2",
					 description: "Gonna teach at this second event.",
					 organization: org)


# Skills

skill = Skill.create(name: "HTML")
skill2 = Skill.create(name: "Ruby on Rails")
skill3 = Skill.create(name: "Python")
skill4 = Skill.create(name: "iOS")
skill5 = Skill.create(name: "PHP")
skill6 = Skill.create(name: "Javascript")
skill7 = Skill.create(name: "CSS")


# Event Skills

EventSkill.create(skill: skill, event: event)
EventSkill.create(skill: skill2, event: event)
EventSkill.create(skill: skill3, event: event2)


# User Skills

UserSkill.create(skill: skill, user: user1)
UserSkill.create(skill: skill, user: user2)
UserSkill.create(skill: skill, user: user3)
UserSkill.create(skill: skill7, user: user1)
UserSkill.create(skill: skill7, user: user2)
UserSkill.create(skill: skill7, user: user3)

# Occurrence

Occurrence.create(event: event,
				  start_time: (DateTime.now + 15.days),
				  end_time: (DateTime.now + 15.days + 2.hours))

Occurrence.create(event: event,
				  start_time: (DateTime.now + 30.days),
				  end_time: (DateTime.now + 30.days + 3.hours))

Occurrence.create(event: event2,
				  start_time: (DateTime.now + 10.days + 1.hour),
				  end_time: (DateTime.now + 10.days + 5.hours))
