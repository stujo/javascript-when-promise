require 'sinatra'
require 'json'

before '/api*' do
  content_type :json
end  

get '/' do
  @title = 'Index'
  erb :index
end  

get '/demo' do
  @title = 'Demo'
  erb :demo
end  

get '/jquery_promise' do
  @title = 'jQuery Promise'
  erb :jquery_promise
end  

get '/native_promise' do
  @title = 'Native JavaScript Promise'
  erb :native_promise
end  

get '/basics' do
  @title = 'Basics'
  erb :basics
end  

get '/api/order.json' do

  items = [
      {item: 'Cuddly Toy', price: 19.99},
      {item: 'Fuzzy Sweater', price: 9.99},
      {item: 'Hoverboard', price: 999.99}
    ]

  sleep(1)  

  JSON.pretty_generate({ 
    items: items,
    order_total: items.reduce(0){ |sum, item|   
      sum + item[:price]
    }
  })
end

get '/api/shipping.json' do
  sleep(1)  
  {shipping_charge: 12.34}.to_json
end

get '/api/taxes.json' do
  sleep(1)  
  {local_taxes: 140.12}.to_json
end


