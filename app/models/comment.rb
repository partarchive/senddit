class Comment < ActiveRecord::Base
  belongs_to :post

  validates :text, presence: true
  validates :email, presence: true, email: true
end
