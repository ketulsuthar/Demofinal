class SearchpeopleController < ApplicationController
@@user = nil

# here used twitter api for twitter search
def search
		@@client = Twitter::REST::Client.new do |config|
  		config.consumer_key        = "LhUrEjR8XYmvjcw0dvN6gkJM8"
  		config.consumer_secret     = "5ShtHEptU4zDVkeArEUwfK7db4qvumWK2p8ePJbJOuInnyciNQ"
  		config.access_token        = "127236301-MlRZx2UqvyFPxcAsIxtusdSrphmtbLtrT8g02nvj"
  		config.access_token_secret = "qjoon1iiJgZtDCRB1PTJLFY0Txw6R79ai4aXgG7pEB25C"
		end
end

def index
@@users = User.all
end

def display

	if params[:username]
        @flag = true
        	if @@client
			  @users = @@client.user_search params[:username]
      		else
        		  @flag = false
      		end
	end
end
end
