class Question < ActiveRecord::Base
  validates :title, null: false, length: {minimum: 1}
  validates :comment, null: false, length: {maximum: 200, minimum: 1}

  has_many :answer, dependent: :destroy  
end
