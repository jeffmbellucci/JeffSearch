class User < ActiveRecord::Base
  attr_accessible :password, :session_token, :username
  attr_accessible :username, :password
    validates :username, uniqueness: true, presence: true
    validates :password, presence: true, length: {minimum: 4}
    has_many :searches
    
    def create_session_token
      new_token = SecureRandom.urlsafe_base64
      self.session_token = new_token
      self.save!
      new_token
    end
     
 end
