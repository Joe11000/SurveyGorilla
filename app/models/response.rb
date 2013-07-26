class Response < ActiveRecord::Base
  validates :survey_id, :presence => true
  validates :taker_id , :presence => true
  validates :option_id, :presence => true

  belongs_to :option
  belongs_to :survey
  belongs_to :taker, :class_name => 'User'
  has_one :question, :through => :options 
end
