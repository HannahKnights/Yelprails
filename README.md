YelpRails
========

### Review site on Rails

My first Rails application 'YelpRails' is a review application in which signed-in users post reviews with ratings. 

This exercise was used to develop my familiarity with developing a Rails application from scratch. It made use of GeoCoder to place plot restaurants on a map, Twitter Bootstrap to quickly develop a styling template, Devise to create a User model with log-in and ActiveRecord to interact with the database.

I user FactoryGirl fixtures in my testing suite to clean-up repitive code and Warden to mock user login. 

Created while studying at [Makers Academy](http://www.makersacademy.com)

#### How to Use

Run the test suite for a more comprehensive overview of the features:

~~~
$ rspec
~~~ 

You can also open the application in heroku (please note: lack of styling (!))

~~~
$ heroku open
~~~ 

#### Technology

* Rails 4
* PostgreSQL
* ActiveRecord
* Devise
* Twitter Bootstrap
* Geocoding
* Deployment with Heroku
* RSpec and Capybara
* Warden and FactoryGirl