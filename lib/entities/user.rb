require 'digest/sha1'

module RPS
  class User < ActiveRecord::Base
    validates :username, :password_digest, :email, presence: true
    validates :username, uniqueness: true
    
    has_many :matches
    has_many :rounds, through: :matches
    has_many :sessions

    def update_password(password)
      self.password_digest = Digest::SHA1.hexdigest(password)
    end

    def has_password?(password)
      Digest::SHA1.hexdigest(password) == self.password_digest
    end
  end
end
