get '/users/:id/books/new' do
	@user = User.find(params[:id])
  erb :'books/new'
end

post '/users/:id/books' do
	@user = User.find(params[:id])
	# @book = @user.books.new(params[:book])
  @book = Book.new(params[:book])
  @book.users << @user
	if @book.save
    p @book.users
    p @user.books
		redirect "/users/#{@user.id}"
	else
		@errors = @book.errors.full_messages
		erb :'books/new'
	end
end

get '/users/:id/books' do
  redirect "/users/#{params[:id]}"
end

get '/users/:user_id/books/:id' do
  @user = User.find(params[:user_id])
  @book = Book.find(params[:id])

  erb :'books/show'
end

delete '/users/:user_id/books/:id' do
  @user = User.find(params[:user_id])
  @book = Book.find(params[:id])

  @book.destroy
  redirect "/users/#{@user.id}"
end


