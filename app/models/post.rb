class Post < ApplicationRecord
  belongs_to :user, :class_name => "User", :foreign_key => 'author_id'

  validates :author_id, presence: true
  validates :content, presence: true
end
