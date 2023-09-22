# dx5_assessment
DX5 assessment solution

## Requirements
* Application must fetch data from a given API endpoint and display it on screen
* API used for data: A simple Node.js + Express script hosted on Heroku, or that I can run locally, that returns mock user data
* User interface must utilize common Flutter widgets like ListView, Text, etc to display fetched data
* Code quality best practices like separation of concerns, single responsibility principle, etc, should be followed
* Declare required dependencies in pubspec.yaml and import them correctly
* Add error handling for API calls
* Write well documented, clean and readable code
* Application must run and display fetched data successfully on emulator/simulator

  ## Getting started
  This repository contains two directories:
   * node_api
   * dx5_games

  The node_api contains code for a CRUD API hosted on Heroku.
  To get started clone the repository then switch to your desired directory. The main focus of this guide will be dx5_games as per the assessment requirements.

  ## dx5_games
    This is flutter code that builds a mobile app which fetches data from the provided node_api

  ### Instructions:
    * While in the project directory run:flutter pub get to fetch the required dependencies
    * Ensure you have an emulator running or physical device connected Then run : flutter run  to start the app
 
  ### How it works
  * The app starts by calling a get function to fetch all games from the API
  * During the initial call, user's internet connectivity is also checked.
  * If the user has internet then the data from the API will be displayed in a list
  * If there is no internet a snackbar will notify the user while the app listens for connection updates

  ### Extras
  Fetching and displaying data from the API was straight forward so I also implemented Create, Update and Delete on the mobile client
  * To Create a new game tap on the floating action button on the bottom right of the page
  * To Update a game tap the pencil icon on right side of each game widget
  *  To Update a game tap the delete icon on right side of each game widget
  


  



