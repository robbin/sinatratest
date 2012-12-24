get '/' do
  p = Post.find 1
  "Hello world! #{p.name}\n"
end

get '/post/:id' do
  content_type :json
  p = Post.find params[:id]
  p.to_json
end
  
get '/example.json' do
  content_type :json
  { :key1 => 'value1', :key2 => 'value2' }.to_json
end
