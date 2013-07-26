class Survey < ActiveRecord::Base
   validates :name,    :presence => true
   validates :creator_id, :presence => true  

   has_many :questions
   has_many :takers, :through => :reponses
   belongs_to :creator, class_name: 'User'
end
