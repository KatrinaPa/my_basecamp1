# README

# My Basecamp 1 - Ruby on Rails Project

**My Basecamp 1** is a web-based project management application built using Ruby on Rails. It mimics the core features of the original Basecamp tool, enabling users to organize, manage, and track projects efficiently.

## Screenshots

<img src="/app/assets/images/scr1.png" width="300">
<img src="/app/assets/images/scr2.png" width="300">

This project allows users to:

- **Sign up and Sign in**: Users can create accounts, sign in, and securely manage their profiles.
- **Create, Edit, and Delete Projects**: Users can create new projects, edit existing ones, or delete them if necessary.
- **Manage Project Members**: The creator of a project (or admin) can invite other users to join as project members and assign roles (admin or member).
- **Assign and Track To-Do Tasks**: Within each project, project creator (or admin) can create tasks to track progress and set deadlines, ensuring the team stays on target.
- **Role-Based Access Control**: Users have different levels of access, such as admins who can manage project members, and regular members who can contribute to tasks and discussions.

This README will guide you through setting up and running the **My Basecamp 1** application on your local machine, from installation to database configuration and running the server.

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

## Credits

This project was developed by **Katrina Pastore Ozolina (pastore-\_k)** and **Jurga Kupstyte (kupstyte_j)** as part of a school assignment for **Start School**.
