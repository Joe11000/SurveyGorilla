class Survey < ActiveRecord::Base
  validates :name,    :presence => true
  validates :creator_id, :presence => true

  has_many :questions
  has_many :responses
  has_many :takers, :through => :reponses
  belongs_to :creator, class_name: 'User'

  def self.build_survey(params, current_user)
    survey = self.create(name: params[:name], creator_id: current_user.id)
    survey_data = params[:survey_data]
    survey_data.each do |question_data|
      question = survey.questions.create(text: question_data[:question])
      question.options.create(question_data[:options])
    end      
    return survey
  end

  def self.update_survey(params, current_user, survey_id)
    # This is really HARD , ask Kevin about football example #
    return survey
  end

end
