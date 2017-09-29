require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

get('/') do
  @stores = Store.all()
  erb(:index)
end

post('/') do
  name = params['name']
  @store = Store.new({name: name})
  if @store.save()
    redirect('/')
  else
    erb(:errors)
  end
end

get('/add_shoes/:id') do
  @store = Store.find(params["id"])
  @stores = Store.all()
  erb(:add_shoes)
end

post ('/add_shoes/:id') do
  @store = Store.find(params["id"])
  make = params["make"]
  @brand= Brand.new({make: make})
  if @brand.save()
    @store.brands.push(@brand)
    @brand= Brand.find(params["id"])
    @stores = Store.all()
    erb(:add_shoes)
  else
    erb(:errors)
  end
end

get('/all_stores_brand/:id') do
  @brand= Brand.find(params["id"])
  @stores = Store.all()
  erb(:all_stores_for_brand)
end
