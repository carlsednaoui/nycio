class Organization < ActiveRecord::Base
	has_many :events
	has_many :user_organizations, dependent: :destroy
	has_many :users, through: :user_organizations

	def manager_users
		self.users.where('user_organizations.manager IS true')
	end
end
