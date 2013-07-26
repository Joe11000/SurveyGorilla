get '/surveys/users/:id' do
  @surveys = ["Survey 1", "Survey 2", "Survey 3"]
  erb :'surveys/index'
end

# new survey form
get '/surveys/new' do
  erb :'surveys/new'
end

# create survey
post '/surveys/new' do
  # @survey = Survey.new(name:params[:name], creator_id:current_user.id)
  # @survey.save
  # @question = Question.new(survey_id: @survey.id, text: params[:question])
  # @question.save
  # @question.options.create(params[:options])

  @survey = Survey.create(name:params[:name], creator_id:current_user.id)
  @question = @survey.questions.create(text: params[:question])
  @question.options.create(params[:options])

  redirect to :"surveys/#{@survey.id}"
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :'surveys/show'
end

