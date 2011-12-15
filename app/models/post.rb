class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :link, presence: true, uniqueness: true, url: true
  validates :email, presence: true, email: true
  
  has_many :comments
end
