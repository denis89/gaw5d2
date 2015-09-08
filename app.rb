require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'

before do
  @db = PG.connect(dbname: 'memetube', host: 'localhost')
end

after do
  @db.close
end

get '/' do
  redirect to '/videos'
end

# INDEX
get '/videos' do
  sql = "select * from videos"
  @videos = @db.exec(sql)

  random_video = "select * from videos order by random() limit 1"
  @random = @db.exec(random_video).first
  
  erb :index
end

# NEW
get '/videos/new' do
  erb :new
end

# CREATE
post '/videos' do
  title = params[:title]
  url = params[:url]

  sql = "insert into videos (title, url) values ('#{params[:title]}', '#{params[:url]}') returning id"
  video = @db.exec(sql).first

  redirect to "/videos/#{video['id']}"
end

# SHOW
get '/videos/:id' do
  sql = "select * from videos where id = #{params[:id]}"
  
  @video = @db.exec(sql).first

  erb :show
end

# EDIT
get '/videos/:id/edit' do
  sql = "select * from videos where id = #{params[:id]}"
  @video = @db.exec(sql).first

  erb :edit
end

# UPDATE
put '/videos/:id' do
  sql = "update videos set title = '#{params[:title]}', url = '#{params[:url]}' where id = #{params[:id]} returning id"

  video = @db.exec(sql).first

  redirect to "/videos/#{video['id']}"
end

# DELETE
delete '/videos/:id/delete' do
  sql = "delete from videos where id = #{params[:id]}"
  @db.exec(sql)
  
  redirect to '/videos'
end
