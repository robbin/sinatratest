get '/' do
  p = Post.find :first
  "Hello world! #{p.name}\n"
end

get '/post/:id' do
  content_type :json
  p = Post.find params[:id]
  Post.find_by_sql "SELECT SLEEP(1);"
  p.to_json
end
  
get '/example.json' do
  content_type :json
  { :key1 => '<html>value1</html>', :key2 => 'value2' }.to_json
end
