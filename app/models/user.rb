class User < ApplicationRecord
  attr_accessor :login
  
  has_many :recipes
  has_many :reviews
  	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :trackable, :recoverable, :rememberable, :validatable, 
         authentication_keys: [:login]

  validates :username, presence: true, length: { minimum: 2, maximum: 80 },
            uniqueness: true
  validates :email, presence: true, uniqueness: true

  # Allow user to login via username or email
  def login
  	@login || self.username || self.email
  end

  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end
end
