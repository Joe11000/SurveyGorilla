# require 'faker'

#   User.create({username: 'Eric',
#                email: 'eric.justin.allen@gmail.com',
#                password: 'password'})


# 5.times do
#   user = User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: "password")
#   1.times do
#     survey = user.created_surveys.create!(name: Faker::Lorem.words(3).join(" "), creator_id: user.id)
#     10.times do
#       question = survey.questions.create!(text: "#{Faker::Lorem.sentence(1).chop}?")
#       4.times do
#         puts "in question option creation"
#         question.options.create!(text: Faker::Lorem.words(1).first)
#       end
#     end
#   end
# end
100.times do 
  User.all.each do |user|
    survey = Survey.all.sample
    survey.questions.all.each do |question|
      option = question.options.all.sample
      comp_survey = user.responses.create(survey_id: survey.id, taker_id: user.id, option_id: option.id)
    end
  end
end
