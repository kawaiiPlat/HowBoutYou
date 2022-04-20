# HowBoutYou
HowBoutYou: An improvement on when2meet.

This is a project that aims to provide a modern, cross-platform native and web alternative to the website [when2meet](https://www.when2meet.com).

## Project Status
***This codebase is an early prototype.*** Many features that one would expect in a production product are not fully implemented.

Non-Comprehensive list of features for the project is as follows:
- [x] Sign in with email
- [ ] Sign in with federated account (Github, Google, Facebook, etc...)
- [x] Create an event
- [ ] View an event
- [ ] Share an event via a link or ID.

We created this app as part of CEN3031 Software Engineering for the University of Florida. This means that we may or may not develop it further. It is not intended to be a project of any great significancy, and served mostly as an exercise in the process of software engineering.

# Project Management
Overall direction will be tracked using [Github Projects](https://github.com/kawaiiPlat/HowBoutYou/projects/).

# Getting Started
## Dependancies
This project is managed with Git and the codebase is hosted on Github.

Follow the instructions to [install the flutter SDK on your platform](https://docs.flutter.dev/get-started/install).

## Building and Running the app:
```bash
git clone https://github.com/kawaiiPlat/HowBoutYou
cd howboutyou/howboutyou
flutter pub get
flutter create .
flutter run
```
You will be greeted with an interactive menu that will let you select what platform to build for.


## Deploying
To serve the app, the simpliest method is to use a basic http server for the web app.
```bash
cd howboutyou/howboutyou
flutter build web
cd build/web
python -m http.server 8000
```
Once the server has started, navigate to [localhost:8000](http://localhost:8000) in your browser.

# CI
Using Github Actions for basic flutter CI to check commits and PRs to master
