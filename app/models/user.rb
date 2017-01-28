class User < ApplicationRecord
  has_many :posts
  attr_accessor :remember_token
  #before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: {maximum: 255 }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string
  def self.digest(string)
    #cost = BCrypt::Engine.cost
    #BCrypt::Password.create(string)
    Digest::SHA1.hexdigest(string)

  end

  # Returns a random token
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  #def remember
  #  self.update_attribute(:remember_digest, User.digest(remember_token))
  #end



  # Remembers a user in the database when they sign in
  def create_remember_digest
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

end


