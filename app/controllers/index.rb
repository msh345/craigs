get '/' do
  @categories = Category.all
  erb :index
end

get '/category/:id' do
  @posts = Post.where(:category_id => params[:id])
  @category = Category.find(params[:id])
  erb :posts
end

get '/category/:category_id/post/:post_id' do
  @listing = Post.find(params[:post_id])
  erb :listing
end

get '/new' do
  @categories = Category.all
  erb :new
end


post '/new' do
  category = Category.find(params[:category]) 
  @listing = category.posts.create(params[:post])
  erb :listing
end
