get '/sessions/new' do

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
  session[:id] = nil
  redirect '/sessions/new'
end
