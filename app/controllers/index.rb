get '/' do
  if current_user
    erb :user_profile 
  else
    erb :home
  end
end

