get '/sessions/new' do
  p session[:id]
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(username: params[:username])

  if @user && @user.authenticate(params[:password])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ['Something went wrong!']
    erb :'sessions/new'
  end
end

# get '/sessions/:id' do

#   erb :'/show'
# end

delete '/sessions' do
  p "I dont know what im doing"
  session.delete(:id)
  redirect '/sessions/new'
end
