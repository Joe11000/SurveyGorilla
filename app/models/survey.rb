class Survey < ActiveRecord::Base
   validates :name,    :presence => true
   validates :creator_id, :presence => true  

   has_many :questions
   has_many :takers, :through => :reponses
   belongs_to :creator, class_name: 'User'

   def self.build_survey(params, current_user)
    survey = self.create(name: params[:name], creator_id: current_user.id)
    question = survey.questions.create(text: params[:question])
    question.options.create(params[:options])
    return survey
   end
end
