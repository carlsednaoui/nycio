class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = %w[admin]

  has_many :user_organizations, dependent: :destroy
  has_many :organizations, through: :user_organizations

  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills

  after_create :assign_default_role

  def assign_default_role
    add_role(:volunteer)
  end

  def full_name
    first_name + ' ' + last_name
  end
end
