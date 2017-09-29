require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}
require "pry"

get('/') do
  @stores = Store.all()
  erb(:index)
end

get('/all_shoes/') do
  @stores = Store.all()
  @brands = Brand.all()
  binding.pry
  erb(:all_shoes)
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
  erb(:add_shoes)
end

post ('/add_shoes/:id') do
  @store= Store.find(params["id"])
  make = params["make"]
  price = params["price"]
  brand= Brand.create({make: make, price: price})
  brand.save()
  @store.brands.push(brand)
  erb(:add_shoes)
end

get('/all_stores_brand/:id') do
  @brand = Brand.find(params["id"])
  @brands = Brand.all
  @stores = Store.all()
  erb(:all_stores_for_brand)
end
