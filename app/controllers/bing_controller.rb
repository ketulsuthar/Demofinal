class BingController < ApplicationController
  def index
  end

def search
# here first check if keyword exist or not in database if exist than if part execute otherwise elsepart

if Keyword.where(:key => params[:q]).present?
puts 'ketul'

@WebSearchResult = Keyword.find_all_by_key(params[:q])

# in this part it search keyword from bingsearch api and store result(20) in database
else
	require 'net/http'
	require "json"
	@accountKey = 'ZP8PLNDGsSo/B2GeAgisJr8zxou0If59k18A+RXV1fQ'
      	@str='%27'
      	params[:q].to_s.split(' ').each { |s| @str=@str+'%20'+s }

# 20 result display
      	@str=@str + '%27&$top=20&$format=json'
	@final='https://api.datamarket.azure.com/Bing/Search/v1/Composite?Sources=%27web%27&Query='+@str

      	url=@final

      	uri = URI(url)

      	req = Net::HTTP::Get.new(uri.request_uri)

      	req.basic_auth '', @accountKey
      
      	res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') { |http|
        http.request(req)
      }
#this is parsiing process which convert json object
	result = JSON.parse(res.body)
	@WebSearchResult = result["d"]["results"]
	@WebSearchResult.each do |result|				
		webresult = result["Web"] 
		webresult.each do |webr| 
		
#store result into database
		Keyword.new(:key=>params['q'], :title=>webr["Title"], :description=>webr["Description"], :displayUrl=>webr["DisplayUrl"]).save
		end
	end
@WebSearchResult = Keyword.find_all_by_key(params[:q])
  end
end

  def show
	keyword = Bing.new title: params[:title], description: params[:description], displayUrl: params[:displayUrl]
    if !keyword.save
      puts "some error"
    end   
    @newkey = keyword
  end
end
