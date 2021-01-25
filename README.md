# Showcase Blog Coding Challenge

## Intro

This challenge will ask you to add a couple features to this simple blog.
Don't spend more than a couple hours on this. If you don't finish, that's okay!
It's meant as a place to start a discussion about some code and allow us to add an additional feature
or two in a pair programming session.

This is a standard rails app with a couple dependencies outside what comes with `rails new`.
* rspec
* factorybot

## Setup

To get the app up and running you'll need to:

* Clone the repository to your local machine
* This codebase uses ruby 2.7.1 via the `.ruby-version` file
* Install the gems with `bundle install`
* Create a database `rails db:create`
* Migrate the database `rails db:migrate`
* The server should now start with `rails s`

## Tasks

Please complete the following task.

* Right now, there's no way to add posts.
  * Your task is to create an API endpoint that accepts JSON for a post and returns the post and a status message.

Please select one or two of the below features to add to the blog. You don't need to do all of them, but select one or 2 that you still have time for.

* Currently, the index method returns all posts. Your task is to paginate the response and allow for a subset to be returned each time. Your response should include the current page and number of pages.
* The admin endpoints are insecure. Your task is to implement a simple authorization scheme via an authorization header that contains an api key.
* The blog is without a tagging system. Implement a way to tag blog posts.

