class Search < ActiveRecord::Base
  attr_accessible :address, :radius, :subject, :title, :user_id
  validates :address, :radius, :subject, :title, presence: true
  validate :radius_too_big
  belongs_to :user
  NEW_KEY = "AIzaSyB53uQVbh2_6dNpi6XTtsLb2pCeK31gFEc"
  
  def radius_too_big
   self.errors.add(:radius," is too large") if radius.to_i > 5000
 end 
end