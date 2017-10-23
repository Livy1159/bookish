get '/users/new' do

  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do

  if params[:id] == session[:id].to_s
    @user = User.find(params[:id])
    @books = @user.books
    erb :'users/show'
  else
    redirect "/users/#{session[:id]}" if session[:id]
    redirect '/sessions/new'
  end
end
