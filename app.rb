require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}
require "pry"

get('/') do
  @stores = Store.all()
  @brands= Brand.all()
  erb(:index)
end

get('/add_store') do
  @stores = Store.all()
  @brands = Store.all()
  erb(:add_store)
end

post('/add_store') do
  name = params['name']
  @store = Store.new({name: name})
  if @store.save()
  redirect('/add_store')
  else
    erb(:errors)
  end
end

delete("/delete_store") do
  if params.has_key?('store_ids')
    params.fetch('store_ids').each do |s|
      store_ids = params.fetch('store_ids')
      store_ids.each do |s|
        Store.find(s).delete()
      end
      redirect('/add_store')
    end
    else
      erb(:random_errors)
  end
end

get('/add_shoes') do
  @brands= Brand.all()
  erb(:add_shoes)
end

post('/add_shoes') do
  make = params['make']
  price = params['price']
  @brand = Brand.new({make: make, price: price})
  if @brand.save()
  redirect('/add_shoes')
  else
    erb(:errors_shoes)
  end
end

delete("/delete_brand") do
  if params.has_key?('brand_ids')
    params.fetch('brand_ids').each do |b|
      brand_ids = params.fetch('brand_ids')
      brand_ids.each do |b|
        Brand.find(b).delete()
      end
      redirect('/add_shoes')
    end
    else
      erb(:random_errors)
  end
end

get('/add_shoes_to_store/:id') do
  @store= Store.find(params["id"])
  @brands= Brand.all()
  erb(:add_shoes_to_store)
end

post('/create_shoes_to_store/:id') do
  @store= Store.find(params["id"])
  make = params["make"]
  price = params["price"]
  @brand= Brand.new({make: make, price: price})
  if @brand.save
    @store.brands.push(@brand)
    redirect("/add_shoes_to_store/#{@store.id}")
  else
    erb(:errors_shoes)
  end
end

post('/add_shoes_to_store/:id') do
  @store = Store.find(params["id"])
  if params.has_key?('brand_ids')
    params.fetch('brand_ids').each do |b|
      brand= Brand.find(b)
      @store.brands.push(brand)
      redirect("/add_shoes_to_store/#{@store.id}")
    end
  else
    erb(:random_errors)
  end
end

post('/update_store_name/:id') do
  @store= Store.find(params["id"])
  name= params["name"]
  @store.update({name: name})
  redirect("/add_shoes_to_store/#{@store.id}")
end

delete('/add_shoes_to_store/:id') do
  binding.pry
  @store = Store.find(params["id"])
  @store.delete
  erb(:index)
end

get('/all_shoes/:id') do
  @store = Store.find(params["id"])
  @stores = Store.all()
  erb(:all_shoes)
end

get('/all_stores/:id') do
  @brand = Brand.find(params["id"])
  @brands = Brand.all()
  @stores = Store.all()
  erb(:all_stores)
end
