get '/users/:id/books/new' do
	@user = User.find(params[:id])

  if request.xhr?
    erb :'books/new', layout: false
  else
    erb :'books/new'
  end
end

post '/users/:id/books' do
	@user = User.find(params[:id])
	# @book = @user.books.new(params[:book])
  @book = Book.new(params[:book])
  @book.users << @user
	if @book.save
    if request.xhr?
      erb :'books/_list_book', layout: false, locals: { book: @book }
    else
      redirect "/users/#{@user.id}"
    end
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


