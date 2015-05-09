class Todo < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: true, allow_nil: false, allow_blank: false
end
