require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/item')


get('/') do
  Item.clear
  @list = Item.all()
  erb(:list)
end

get('/items/:id') do
  @item = Item.find(params[:id])
  erb(:item)
end

post('/') do
  name = params["name"]
  rank = params["rank"].to_i
  unless (Item.duplicate?(name, rank) || rank < 1 || name == "")
    item = Item.new(name, rank)
    item.save()
  end
  @list = Item.all()
  erb(:list)
end
