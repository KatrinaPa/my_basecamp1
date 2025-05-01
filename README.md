# README

# My Basecamp 1 - Ruby on Rails Project

**My Basecamp 1** is a web-based project management application built using Ruby on Rails. It mimics the core features of the original Basecamp tool, enabling users to organize, manage, and track projects efficiently.

## Task

Building a lightweight project management tool inspired by Basecamp. The challenge was to create a functional application where users can register, create projects, assign admin roles, and manage tasks efficiently within a team environment. The key challenges included implementing user authentication, project-specific permission systems, and creating a clean, intuitive user interface for task management.

## Screenshots

<p>
  <img src="/app/assets/images/scr1.png" width="300" style="display: inline-block; margin-right: 50px;">
  <img src="/app/assets/images/scr2.png" width="300" style="display: inline-block;">
</p>

## Description

My Basecamp 1 is a Ruby on Rails application that provides essential project management functionality:

This application provides:

- **User Authentication**: Register, login, and securely manage user profiles
- **Project Management**: Create, edit, and delete projects
- **Permission System**: Project-specific admin roles for fine-grained access control
- **Team Collaboration**: The creator of a project (or admin) can invite other users to join as project members and assign roles (admin or member)
- **Task Management**: Create task lists and manage individual tasks with completion tracking within each project
- **User-friendly Interface**: Clean, intuitive interface built with Bootstrap for responsive design
  The project follows the MVC (Model-View-Controller) architecture with RESTful routing and responsive design principles for an efficient user experience.

README will guide you through setting up and running the **My Basecamp 1** application on your local machine, from installation to database configuration and running the server.

## Ruby Version

This application uses Ruby version **3.2.2**. You can install this version of Ruby using [RVM](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv).

To check your current Ruby version, run:

ruby -v

## Rails Version

This application uses Rails version 8.0.1. You can check your Rails version with:

rails -v

## System Dependencies

Ensure you have the following installed:
-Ruby 3.2.2
-Rails 8.0.1
-Bundler to manage Ruby gems (run gem install bundler if you don’t have it).
-Node.js for managing JavaScript dependencies.
-Yarn (JavaScript package manager).
-Database: SQLite (or PostgreSQL/MySQL depending on your configuration).

### Install Dependencies

To install the project’s Ruby dependencies, run:

bundle install

## Install JavaScript Dependencies

yarn install

## Configuration

If your application requires environment variables (for example, API keys or credentials), make sure to set them up in your environment. You can use the .env file or configure them directly in your system.
You may also need to configure your database credentials, email service, or any external services used by the app.

## Database Setup

Before running the application, set up the database by running the following commands: 1.**Create the database:**

rails db:create

2.**Run migrations:**

rails db:migrate

3.**Seed the database (optional):**

rails db:seed

## Database initialization

If you need to reset the database or reinitialize it with fresh data, you can run:

rails db:reset

This will drop the database, recreate it, migrate it, and then seed it with default values.

## Running the application

To start the Rails server, run:

rails server

This will start the server on port 3000 by default.
The server will start and you should be able to access the app at:
http://127.0.0.1:3000 in your browser and you can start to test the application locally.

## How to run the test suite

If you'd like to run the test suite, use the following command:

rails test

## Compatibility with DoCode

Please note that the project was built using newer versions of Ruby and Rails. DoCode, the environment used for testing, may have compatibility issues with the newer versions. If you encounter any issues, follow the installation steps carefully and make sure your environment matches the versions specified.

## Project Structure

The project follows the **MVC (Model-View-Controller)** architecture and includes the following core features:

- **User Registration**: Users can sign up, sign in, and manage their accounts, allowing for personalized access to the application.
- **Project Management**: Users can create, edit, and delete projects. The project owner (creator) can add other members, assign roles (Promote to Admin or Demote to Member), and manage tasks within the project.
- **To-Do Tasks**: The project owner can set and manage To-Do tasks within each project to track progress and deadlines.
- **User Interface**: A clean, intuitive, and user-friendly interface for managing projects, users, and tasks, ensuring an efficient user experience.

**Example workflow:**

```
1. Register a new account
2. Create a new project
3. Add members to your project
4. Create task lists
5. Add and manage tasks
6. Track progress through completion percentages
```

## Credits

This project was developed by **Katrina Pastore Ozolina (pastore-\_k)** and **Jurga Kupstyte (kupstyte_j)** as part of a school assignment for **Start School**.
