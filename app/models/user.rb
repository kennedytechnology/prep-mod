class User < ApplicationRecord
  has_and_belongs_to_many :clinics
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :customized_reports
  has_many :patients
  has_many :supply_inventories
  belongs_to :provider, optional: true

  validates_presence_of :first_name, :last_name, :role, :email, :email_confirmation
  validates :email, confirmation: true

  after_save :set_name, if: lambda { name == nil }

  # ROLES
  include RoleModel
  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  roles :super_admin, :government, :regional_admin, :local_admin, :provider_employer,
        :venue_admin, :school_nurse, :lead_staff, :staff
  attr_accessor :user_roles

  def titleized_role
    role.to_s.titleize
  end

  def has_roles?(*passed_roles)
    passed_roles.flatten.map(&:to_s).include?(role)
  end

  def has_role?(passed_role)
    role == passed_role.to_s
  end

  def set_name
    full_name = first_name.to_s + " " + last_name.to_s
    self.update(name: full_name)
  end

  def assignable_roles  
    roles = User.valid_roles.map { |r| [r.to_s.titleize, r.to_s]}
    roles = roles.map.reject { |r| r[1] == 'super_admin' } unless has_role?(:super_admin)
    roles = roles.map.reject { |r| r[1] == 'regional_admin' } unless has_roles?(:super_admin, :regional_admin)
    roles
  end

  def can_create_user?
    return true if has_roles?(:super_admin, :regional_admin, :local_admin, :venue_admin, :provider_employer)
  end
end
