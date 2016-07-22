require 'bundler'
require_relative 'models/model.rb'
Bundler.require

class ApplicationController < Sinatra::Base

  get '/' do
    @title = "Homepage"
    erb :index, :layout => :base
  end
  
  # get '/index.html'
  #   erb :index, layout => :base
   get '/index.html' do
    erb :base, :layout => :base
  end

  # get '/page2' do
  #   @title = "Page 2"
  #   erb :page2, :layout => :base
  # end

  get '/generic.html' do
    erb :base2, :layout => :base2
  end
  
  get '/london_search.html' do
    erb :london_search
  end
  
  get '/sydney_search.html' do
    erb :sydney_search
  end
  
  get '/singapore_search.html' do
    erb :singapore_search
  end
  
  get '/rio_search.html' do
    erb :rio_search
  end
  
  get '/paris_search.html' do
    erb :paris_search
  end
  
  post '/results' do
    @user_input = params[:result]
		@api_response = format_request_and_send_api_call("New York")
		@names_hash = @api_response
		# @addresses = @api_response[1]
    erb :base3, :layout => :base3
  end
  
   post '/london_results' do
     @user_input = params[:result]
		 @api_response = format_request_and_send_api_call("London")
		 @names_hash = @api_response
		 @addresses = @api_response[1]
    erb :london_results
   end
   
     post '/paris_results' do
     @user_input = params[:result]
		 @api_response = format_request_and_send_api_call("Paris")
		 @names_hash = @api_response
		 @addresses = @api_response[1]
    erb :paris_results
   end
   
     post '/singapore_results' do
     @user_input = params[:result]
		 @api_response = format_request_and_send_api_call("Singapore")
		 @names_hash = @api_response
    erb :singapore_results
   end
   
   post '/rio_results' do
     @user_input = params[:result]
		 @api_response = format_request_and_send_api_call("Rio de Janeiro")
		 @names_hash = @api_response
		 @addresses = @api_response[1]
    erb :rio_results
   end
   
     post '/sydney_results' do
     @user_input = params[:result]
		 @api_response = format_request_and_send_api_call("Sydney")
		 @names_hash = @api_response
		 @addresses = @api_response[1]
    erb :sydney_results
   end
  
 
end
