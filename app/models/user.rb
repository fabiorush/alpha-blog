class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :articles
  has_secure_password
  before_save { self.email.downcase! }
  validates :username, presence: true, 
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 3, maximum: 25 },
                    format: { with: VALID_EMAIL_REGEX }
end