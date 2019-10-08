class DonutsController < ApplicationController

  get "/donuts" do #Index
    @donuts = Donut.all
    erb :"donuts/index"
  end

  get'/donuts/new' do #New
    erb :"donuts/new"
  end

  post '/donuts' do #Create
    Donut.create(flavor: params["flavor"], price: params["price"])
    redirect "/donuts"
  end

  get '/donuts/:id' do #Show
    @donut = Donut.find(params[:id])
    erb :'donuts/show'
  end

  get '/donuts/:id/edit' do #Edit
    @donut = Donut.find(params[:id])
    erb :'donuts/edit'
    
  end

  patch '/donuts/:id' do #edit action
    @donut = Donut.find_by_id(params[:id])
    @donut.flavor = params[:flavor]
    @donut.price = params[:price]
    @donut.save
    redirect to "/donuts/#{@donut.id}"
  end


  delete '/donuts/:id/delete' do #Delete
    @donut = Donut.find_by_id(params[:id])
    @donut.delete
    redirect to '/donuts'
  end
end

# http://www.restular.com/