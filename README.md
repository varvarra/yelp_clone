# README

## Instructions

We worked through the challenges throughout the week in rotating pairs.

We used Rails to build a clone of Yelp, an app for reviewing restaurants. Yelp is a popular web application that allows users to rate and review restaurants, and find other diner's ratings and comments. For the rest of the week you will be building a clone of this site using Rails.

## Objectives

Are you having fun?
Are you a better developer than you were yesterday?
Can you use Rails and its conventions to build a web app?
## Using this application

- Download the source code using ``$ git clone``
- Navigate into the root of the directory using ``$ cd yelp_clone``
- Install all the dependencies by running the command ``$ bundle`` in the root directory
- Download PostgreSQL (if you do not already have it installed)
- Within the command line, run `$ bin/rake db:create` and then `$ bin/rake db:migrate`
- Run the app using the command `$ bin/rails server`
- Go to localhost:3000 in a browser to view and interact with the app

## Running the tests

Within the root of the directory, run `$ rspec` to see the results of the tests in the command line

## Dependencies

- Application written in Ruby 2.3.3 and built using Ruby on Rails
- Based on a PostgreSQL database with ActiveRecord as the ORM
- Tested using RSpec and Capybara
- Uses OmniAuth for sign-in with Facebook


## Ideas for extension

- This app currently has no styling so would be nice to make it look more like a finished product
- Adding pictures using Paperclip
- Adding endorsements - use AJAX for this
