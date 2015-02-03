# Games_Extract
This app will parse the HTML for the “Top Playstation 3 Games (By Metascore)” on Metacritic’s PS3 page and return them as JSON

## Requirements:
* ruby
* ruby-dev zlib1g zlib1g-dev (for building native extension)
* bundle

## Installation:
* `git clone https://github.com/ragheed/games_extract.git`
* `gem install bundle` (if not installed)
* `bundle install` (in the app folder)

## Running the tests:
in the app folder run:
`rspec spec` (in the app folder)

## Running the app:
* `bundle exec ruby app.rb` or just `ruby app.rb` (in the app folder)

## Description:
This app is created using Sinatra framework, with Nokogiri gem for parsing HTML / xpath extraction
once the app is running WEBrick server will start listening on port 8888
you can test functionality by the following links:

1. Step 1 
for step one please open the following URL in your browser (or curl/wget it) it will return a JSON array of objects which include game name and score extracted from the site
http://localhost:8888/games

2. Step 2
for step 2 please use the following link (image name is an example) it will return a JSON object which includes game name and score. 
http://localhost:8888/games/Toybox%20Turbos

## Note:
* requesting a non existing game will return 404 HTTP status code with no responce.
* I changed the base url to (http://www.metacritic.com/game/playstation-3?topgames-sort=metascore) just in case the default behaviour of the site was changed to display the other tab by default
