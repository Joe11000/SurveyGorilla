
# show surveys to take
get '/surveys/' do
  @surveys = Survey.all
  erb :'surveys/all_surveys'
end


get '/surveys/users/:id' do
  @surveys = Survey.find_all_by_creator_id(params[:id])
  

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

post '/surveys/update/:survey_id' do
  # @survey = Survey.find(params[:survey_id])
  @survey = Survey.update_survey(params, current_user, params[:survey_id])
  redirect to :"surveys/#{@survey.id}"
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :'surveys/show'
end

get '/take-survey/:id' do
  @survey = Survey.find(params[:id])
  erb :'surveys/take-survey'
end

post '/survey-response/:id' do
  # format array of hashes for responses
  array_of_option_ids = params[:question][0].values
  
  array_of_formatted_hashes = []
  array_of_option_ids.each do |option_id|
    array_of_formatted_hashes << {survey_id: params[:id].to_i, taker_id:current_user.id, option_id:option_id.to_i}
  end

  Response.create(array_of_formatted_hashes)

  redirect '/responses-by-survey'
end

get '/all-responses' do
  @responses = Response.all
  erb :'surveys/all-responses'
end

get '/survey/:id/results' do
  @survey = Survey.find(params[:id])


  erb :'surveys/survey-results'
end






get '/responses-by-survey' do 
  @surveys = Survey.all
  erb :'surveys/responses-by-survey'
end
# [ {taker_id:current_user.id, option_id:option.id},
# {taker_id:current_user.id, option_id:option.id}
# ]
get '/survey/edit/:id' do
  @survey = Survey.find(params[:id])
  erb :'surveys/edit'
end
