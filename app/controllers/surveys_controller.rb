get '/surveys/users/:id' do
  @surveys = ["Survey 1", "Survey 2", "Survey 3"]
  erb :'surveys/index'
end

get '/surveys/new' do
  erb :'surveys/new'
end

post '/surveys/new' do
  # create survey with name
  # survey = Survey.create(name:params[:name], creator_id:current_user.id)

  erb :"surveys/#{survey.id}/questions/new"
end

get '/surveys/:id' do
  @survey = "This is a sick survey, broseph"
  erb :'surveys/show'
end
