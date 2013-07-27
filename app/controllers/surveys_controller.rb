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
  @survey = Survey.build_survey(params, current_user)
  redirect to :"surveys/#{@survey.id}"
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :'surveys/show'
end

