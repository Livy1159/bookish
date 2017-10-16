get '/users/:id/books/new' do
	@user = User.find(params[:id])
	
  erb :'books/new'
end

post '/users/:id/books' do
	@user = User.find(params[:id])
	@book = @user.books.new(params[:book])

	if @book.save
		redirect "/users/#{@user.id}"
	else
		@errors = @book.errors.full_messages
		erb :'books/new'
	end
end

get '/users/:id/books/:id' do
  @user = User.find(params[:id])
  @book = Book.find(params[:id])

  erb :'books/show'
end


