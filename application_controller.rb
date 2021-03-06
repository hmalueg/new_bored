require 'bundler'
Bundler.require
require_relative 'models/model.rb'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  post '/quiz' do
    if params[:bored]=="Yes"
      erb :quiz
    else params[:bored]=="No"
      erb :not_bored
    end
  end 
  post '/last_question' do
    if params[:money]=="no" && params[:nature]=="inside"
      erb :cheap_and_inside
    elsif params[:money]=="no" && params[:nature]=="outside"
      erb :cheap_and_outside
    elsif params[:money]=="yes" && params[:nature]=="inside"
      erb :money_and_inside
    else params[:money]=="yes" && params[:nature]=="outside"
      erb :money_and_outside
    end
  end
  post '/results' do 
   if params[:thing]=="tv show"
    @output = ($arr[:cheap][:in][:tv][rand($arr[:cheap][:in][:tv].length)])
   elsif params[:thing]=="book"
     @output = ($arr[:cheap][:in][:book][rand($arr[:cheap][:in][:book].length)])
   elsif params[:thing]=="sport"
     @output = ($arr[:cheap][:out][:sport][rand($arr[:cheap][:out][:sport].length)])
   elsif params[:thing]=="nature"
     @output = ($arr[:cheap][:out][:nature][rand($arr[:cheap][:out][:nature].length)])
   elsif params[:thing]=="restaurant"
     @output = ($arr[:expensive][:in][:restaurant][rand($arr[:expensive][:in][:restaurant].length)])
   elsif params[:thing]=="movie"
     @output = ($arr[:expensive][:in][:movie][rand($arr[:expensive][:in][:movie].length)])
   elsif params[:thing]=="sightseeing"
     @output =($arr[:expensive][:out][:sightseeing][rand($arr[:expensive][:out][:sightseeing].length)])
   else params[:thing]=="shopping"
     @output =($arr[:expensive][:out][:shopping][rand($arr[:expensive][:out][:shopping].length)])
   end
    erb :results
  end
end