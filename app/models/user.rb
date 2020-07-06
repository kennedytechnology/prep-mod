class User < ApplicationRecord
  has_and_belongs_to_many :clinics
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :customized_reports
  has_many :patients
  belongs_to :provider, optional: true

  validates_presence_of :email, :first_name, :last_name, :role
  validates_uniqueness_of :email

  def name
    first_name.to_s + " " + last_name.to_s
  end
end
