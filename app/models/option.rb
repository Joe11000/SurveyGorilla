class Option < ActiveRecord::Base
  validates  :text,      :presence => true
  validates  :question_id, :presence => true

  belongs_to :question
  has_many :responses
end
