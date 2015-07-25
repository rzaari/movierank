class MoviesController < ApplicationController

	require 'rest_client'

	def index

	headers = {
	  :content_type => 'application/json',
	  :trakt_api_version => '2',
	  :trakt_api_key => '6aa4d1f769d6b0554862196d91c768fe748a3bb43408ecee2899896cd8ecec71' #for production
   #:trakt_api_key => '59dbfc8724887b3c99e1da3e0cebe8f5a26c6cfbbff58174a5ddf7fb76a30b1b' # for staging
	}

response = RestClient.get 'https://api-v2launch.trakt.tv/movies/trending', headers  #for production
#response = RestClient.get 'http://api.staging.trakt.tv/movies/trending', headers # for staging
	json_response = JSON.parse response.body


	@rand1 = rand(json_response.length)
	@rand2 = rand(json_response.length)
	while @rand1 == @rand2
	@rand1 = rand(json_response.length)
	@rand2 = rand(json_response.length)
	end

	@randmovie1 = HTTParty.get("http://www.omdbapi.com/?t=#{URI.encode(json_response[@rand1]["movie"]["title"])}")
	@randmovie2 = HTTParty.get("http://www.omdbapi.com/?t=#{URI.encode(json_response[@rand2]["movie"]["title"])}")



		#  @randnum1 = (1 + rand(2155529)).to_s.rjust(7, '0')
		#  #@randmovie1 = OMDB.id("tt#{@randnum1}")
		#  @randmovie1 = HTTParty.get("http://www.omdbapi.com/?i=tt#{@randnum1}")
		#  while @randmovie1["Type"] =="episode" || @randmovie1["Poster"] =="N/A" || @randmovie1["Year"].to_i < 2010
		#  	@randnum1 = (1 + rand(2155529)).to_s.rjust(7, '0')
		#  	@randmovie1 = HTTParty.get("http://www.omdbapi.com/?i=tt#{@randnum1}")
		#  end 

		# @randnum2 = (1 + rand(2155529)).to_s.rjust(7, '0')
		# @randmovie2 = OMDB.id("tt#{@randnum2}")
		# while @randmovie2.type =="episode" || @randmovie2.poster =="N/A" ||  @randmovie2["Year"].to_i < 2010
		# 	@randnum2 = (1 + rand(2155529)).to_s.rjust(7, '0')
		# 	@randmovie2 = OMDB.id("tt#{@randnum2}")
		# end 

	end


end
