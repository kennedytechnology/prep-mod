class User < ApplicationRecord
  has_and_belongs_to_many :clinics
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :customized_reports
  has_many :patients
  has_one :providers

  validates_presence_of :email, :name, :role
  validates_uniqueness_of :email
end
