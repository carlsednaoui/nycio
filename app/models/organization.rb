class Organization < ActiveRecord::Base
  acts_as_paranoid
	has_many :events
	has_many :user_organizations, dependent: :destroy
	has_many :users, through: :user_organizations

	validates :name, :description, presence: true

	def manager_users
		self.users.where('user_organizations.manager IS true')
	end
end
