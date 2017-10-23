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
  @user = User.find(params[:id])
  @books = @user.books
  p @user.books
  erb :'users/show'
end