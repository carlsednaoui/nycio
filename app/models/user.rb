class User < ActiveRecord::Base
  rolify

  before_save :set_volunteer_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[admin volunteer]

  has_many :user_organizations, dependent: :destroy
  has_many :organizations, through: :user_organizations

  validates :first_name, :last_name, :phone, :gender, :birthdate, presence: true

  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills

  after_create :assign_default_role

  def assign_default_role
    add_role(:volunteer)
  end

  def full_name
    name = []
    name.push(first_name, last_name)
    return name.join(' ')
  end

  def is_public?
    self.public
  end

  def is_volunteer?
    self.roles.where(name: 'volunteer').exists?
  end

  def is_admin?
    self.roles.where(name: 'admin').exists?
  end


  def manager_organizations
    self.organizations.where('user_organizations.manager IS true')
  end

  def manager_events
    Event.where("events.organization_id IN (?)", self.manager_organizations.pluck(:id))
  end

  private
    def set_volunteer_role
      self.add_role :volunteer
    end
end
