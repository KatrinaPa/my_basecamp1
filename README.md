# README

# My Basecamp 1 - Ruby on Rails Project

This README will guide you through setting up and running the **My Basecamp 1** application on your local machine.

## Ruby Version

This application uses Ruby version **3.2.2**. You can install this version of Ruby using [RVM](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv).

To check your current Ruby version, run:

```
ruby -v
```

## Rails Version

This application uses Rails version 8.0.1. You can check your Rails version with:

```
rails -v
```

## System Dependencies

Ensure you have the following installed:
-Ruby 3.2.2
-Rails 8.0.1
-Bundler to manage Ruby gems. To Install the Project’s Dependencies, run:

```
bundle install
```

-Node.js (for managing JavaScript dependencies)
-Yarn (JavaScript package manager)
-Database: PostgreSQL / MySQL / SQLite (depending on your configuration)

## Configuration

If your application requires environment variables (for example, API keys or credentials), make sure to set them up in your environment. You can use the .env file or configure them directly in your system.
You may also need to configure your database credentials, email service, or any external services used by the app.

## Database creation

Before running the application, you need to set up the database. To create the database, run the following commands:

```
rails db:create
```

```
rails db:migrate
```

```
rails db:seed # Optional, if you have seed data to load
```

## Database initialization

If you need to reset the database or reinitialize it with fresh data, you can run:

```
rails db:reset
```

This will drop the database, recreate it, migrate it, and then seed it with default values.

## Running the application

To start the Rails server, run:

```
rails server
```

This will start the server on port 3000 by default.
The server will start and you should be able to access the app at:
http://127.0.0.1:3000 in your browser and you can start to test the application locally.

## How to run the test suite

If you'd like to run the test suite, use the following command:

```
rails test
```
