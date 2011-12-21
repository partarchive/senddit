class Comment < ActiveRecord::Base
  belongs_to :post

  validates :post, presence: true
  validates :text, presence: true
  validates :email, presence: true, email: true
end
