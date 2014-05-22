class Organization < ActiveRecord::Base
  acts_as_paranoid
	has_many :events
	has_many :user_organizations, dependent: :destroy
	has_many :users, through: :user_organizations

  # a person can create and tentatively own an organization
  belongs_to :user

	def manager_users
		self.users.where('user_organizations.manager IS true')
	end
end
