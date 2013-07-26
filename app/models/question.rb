class Question < ActiveRecord::Base
  validates :text,      :presence => true
  validates :survey_id, :presence => true  

  belongs_to :survey
  has_many :options
end
