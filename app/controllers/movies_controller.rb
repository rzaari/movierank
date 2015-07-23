class MoviesController < ApplicationController

	def index

		@randnum1 = (1 + rand(2155529)).to_s.rjust(7, '0')
		@randmovie1 = OMDB.id("tt#{@randnum1}")
		while @randmovie1.type =="episode" || @randmovie1.poster =="N/A"
			@randnum1 = (1 + rand(2155529)).to_s.rjust(7, '0')
			@randmovie1 = OMDB.id("tt#{@randnum1}")
		end 

		@randnum2 = (1 + rand(2155529)).to_s.rjust(7, '0')
		@randmovie2 = OMDB.id("tt#{@randnum2}")
		while @randmovie2.type =="episode" || @randmovie2.poster =="N/A"
			@randnum2 = (1 + rand(2155529)).to_s.rjust(7, '0')
			@randmovie2 = OMDB.id("tt#{@randnum2}")
		end 

	end


end
