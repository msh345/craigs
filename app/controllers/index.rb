get '/' do
  @categories = Category.all
  erb :index
end

get '/category/:id' do
  @posts = Post.where(:category_id => params[:id])
  @category = Category.find(params[:id])
  erb :posts
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end

get '/new' do
  @categories = Category.all
  erb :new
end

get '/post/:id/edit/:key' do
  @post = Post.find(params[:id])
  erb :edit
end


post '/new' do
  o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
  key = (0...5).map{ o[rand(o.length)] }.join
  hash = params[:post].merge!({:key => key})
  category = Category.find(params[:category]) 
  @post = category.posts.create(hash)
  redirect to "/post/#{@post.id}/edit/#{@post.key}"
end

post '/post/:id' do
  @post = Post.find(params[:id])
  if @post.update_attributes(params[:post])
    redirect to "/post/#{params[:id]}"
  else
    erb :edit
  end
end

get '/post/:id/delete' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect to ('/')
end

