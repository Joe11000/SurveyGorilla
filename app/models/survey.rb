class Survey < ActiveRecord::Base
   validatates :name,    :presence => true
   validatates :creator_id, :presence => true  

   has_many :questions
   has_many :takers, :through => :reponses
   belongs_to :creator, :class_name => 'User'
end
