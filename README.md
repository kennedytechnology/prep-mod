# Installation

## Requirements

* A recent version of macOS, Linux, or Windows with Microsoft WSL
* The version of Ruby specified in `.ruby-version`
* The "bundler" Ruby gem
* Node.js 10.17.0+
* Yarn 1.x+
* PostgreSQL database server
* An account with Google Maps API
* A Twilio developer account

## Installation: Native

* First, configure the application according to your local environment (See "Configuration"). 
* In the application directory, run:
  * `bundle` to install Ruby dependencies
  * `yarn install` to install Javascript dependencies
  * `rails db:setup` to set up the database structure and load the sample data for the app

## Installation: Docker

  * First make sure that you have the latest version of Docker installed.
  * In the project root, run `docker-compose up`.
  * In a separate terminal, run `docker-compose run web rake db:reset` to set up the database structure and load the sample data for the app

## Installation: Docker w/ Visual Studio Code

  * Requirements:
    * The latest version of Visual Studio Code
    * The "Remote - Containers" extension for Visual Studio Code
    * The latest version of Docker

If you open the project in Visual Studio Code when the "Remote - Containers" extension is installed, an option to open the project in a container will be offered. This will automatically set up the app to run in Docker while open in Visual Studio Code.

In the terminal, run `rails db:setup` to set up the database structure and load the sample data for the app. Check the "Remote Explorer" sidebar for container status and port forwarding.

## Getting Started

Once the application is set up, you can:

* `rails server` • Run the web server (under Docker, the server may automatically be running)
* `rails spec` • Run automated tests
* `rails console` • Access the console


# Configuration

The application will look for its configuration in these environment variables:

* **DATABASE_URL**: Login for application's PostgreSQL database
* **GOOGLE_MAPS_API_KEY**: Used for geographic data, geocoding, display of static maps  
* **SITE_NAME**: The location of the application, as displayed to the user (Usually a URL)
* **SITE_URL**: The URL of the application.
* **SITE_HOST**: The host name where the application is running
* **SITE_PORT**: The port number where the application is running
* **TWILIO_SID**: Twilio account ID
* **TWILIO_AUTH_TOKEN**: Twilio account key
* **TWILIO_FROM_PHONE**: The phone number from which SMS messages will be sent
* **SLACK_NOTIFY_URL**: A callback URL for reporting errors to a chat room
* **SCHOOL_VACCINATION_MODE**: Switching from Regular to School Mode

# Application source code layout

This is a summary of the layout of the source code for the application. Any directories not listed here are probably a part of the Rails framework, and more information can be found in its documentation about them.

* app: Contains most of the application
  * admin: Contains the code for the admin part of the site, using ActiveAdmin library
  * assets: Client-side assets, including images, CSS, and Javascript. Only static assets and those involved with third-party code go here. Other Javascript and CSS code goes in `/app/javascript`
  * controllers: The C in MVC, goes here. The files in this directory are part of the Clinic Management part of the site. The files which are public-facing and do not require authentication as a user are in the "public" directory.
  * decorators: These classes implement the decorator pattern, imbuing instances of other objects with specialized behavior, usually for display purposes.
  * helpers: Helper classes contain functionality reused throughout the views.
  * inputs: Custom classes of input fields used in views are contained here.
  * javascript: Javascript and CSS files that are processed by webpacker
  * jobs: Code which should not run in-thread with a web response is instead run in a "job" which can be queued and performed by a separate back-end server asynchronously.
  * mailers: These classes send email for the application
  * models: The M in MVC, the data models for the application are here. These classes contain the majority of the business logic of the application, and, (as a very strict rule...) are the only way in which the application ever accesses the database.
  * views: The V in MVC, these are templates which contain minimal logic and are concerned solely with generating the proper markup and response content to be sent to the client.
* config: Configuration for the application
  * initializers: Most of these are used to configure third-party libraries to use configuration from the environment variables.
    * constants.rb: This file is notable because it defines many constants, strings, and collections used throughout the application.
  * routes.rb: This is a key configuration file, because it configures the routing for the application, and defines how URLs are converted into code entry points in the controllers.
* db
  * schema.rb: This defines the structure of the database
  * seeds.rb: This is a script that loads sample data into the database
* public: Static content that is served directly by the web server without any processing by the application
* spec: Automated tests (most directories mirror the folder in /app which conerns what they test)
  * factories: Creates simulated objects for use in testing
* Gemfile: Defines dependencies from the Ruby package manager
* package.json: Defines dependencies from the Javascript package manager

