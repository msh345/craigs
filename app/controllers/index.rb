get '/' do
  @categories = Category.all
  erb :index
end

get '/category/:id' do
  @posts = Post.where(:category_id => params[:id])
  @category = Category.find(params[:id])
  erb :posts
end
