
# README

## Requirements

* Ruby version -- 2.5.3

* Rails version -- 5.2.3

* Configuration  --  RVM, Postgres must be installed

* Database creation - `rake db create`

* Database initialisation - `rake db:migrate`

* How to run the test suite - `bundle exec rspec`

## Installation steps

 - Clone repository : `git clone https://github.com/railstesh/url_shortener.git`
 - Change Ruby version using RVM: `rvm use ruby-2.5.3`
 - Run: `bundle install`
 - Configure `database.yml` file provide postgres username, password
 - Run: `rails db:create`
 - Run: `rake db:migrate`
 - Run: `rails s`
 
 ## Algorithm Description
	 
 - *We have created a service here to generate a token which is a random hexadecimal value token.*
 - *Then we have saved this token to database with main URL *
 - *When user make a POST request for shortening the URL *
 -  *Then we first check the existence of that URL into database if the record is not present then we generate a token for that requested url and assemble a Short-URL and return it as json response*
	 - *for example: Input-url: `http://somehting-something.com`*
	 - Then algorithm generates a token ex: `29c893`
	 - After Short-URL assembly the output is: `https://your-domain.com/29c893`
 -  *If the requested URL is present in database then we fetch it's already created token from database and assemble the Short-URL *
 	 - *for example: Input-url: `http://somehting-something.com`*
	 - Then algorithm fetch a token for database ex: `29c893`
	 - After Short-URL assembly the output is: `https://your-domain.com/29c893`
 - Create Shorten-URL API response:
	 

    {
    "status": true,
    "shorten_url": "https://your-domain.com/90d503",
    "existing_value": true
}

		### Response Description
		

> - status: Request status either successful or fail
> - shorten_url: Result of the API shorten URL
> - existing_value: The URL is already exist in db

 - *If the short URL get fired in browser a request comes to this application we fetch the token from request and pull the database record corresponding to that token and then redirection the user to the main URL mentioned in the record *
