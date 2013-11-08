
![logo](https://github.com/maxsilver/camp-blodgett/wiki/images/logo-web.png)

Camp Blodgett - Registration and Reporting
===================================

The Camp Blodgett Registration and Reporting application, or **camp-blodgett** is a Ruby on Rails Web Application aimed to help the Camp Blodgett create and maintain relevant and accurate camper attendance and registration records, as well as generate reports based on this data, for use with the campground operations as well as assisting with the organizations goals.

Resources
------------------------------------
As a member of this project, you should have access to the following resources.

+ [**GitHub** : https://github.com/maxsilver/camp-blodgett](https://github.com/maxsilver/camp-blodgett)
+ [**Trello** : https://trello.com/b/VrToIeHr/camper-registration-database](https://trello.com/b/VrToIeHr/camper-registration-database)
+ [**Google Drive** : https://drive.google.com/folderview?id=0B4_qm5HsWutlQXIyOW5rTG4xUlk](https://drive.google.com/folderview?id=0B4_qm5HsWutlQXIyOW5rTG4xUlk)




Installing Camp Blodgett for Development
-----------------------------------
The guide will assume your using either a Mac OSX or Linux environment, and a compatible package manager (Something like [Homebrew](http://mxcl.github.com/homebrew/) for OSX, or APT for Linux). It also assumes, you have [RVM](https://rvm.io/rvm/install/), and [MySQL](http://dev.mysql.com/doc/refman/5.5/en//installing.html) set up locally.

```bash
# Clone this project from GitHub
git clone git@github.com:maxsilver/camp-blodgett.git
cd camp-blodgett

# Install the proper version of Ruby (if RVM hasn't done this for you already)
rvm install ruby-2.0.0-p247
rvm reload

# Have Bundler install the required dependencies
gem install bundler
bundle install --path vendor/bundle

# Create the project databases
bundle exec rake db:create:all db:schema:load

# Seed some test data for development use (Optional)
bundle exec rake db:seed

# Start the server
bundle exec rails server -p 3001

# Open your Webbrowser
open http://localhost:3001
```




Running Tests
-----------------------------------
(TODO : Write this section.)



Deploying to Staging
-----------------------------------
Our staging server is hosted on Heroku :

```bash
# Add the remote for Heroku in your git config
git remote add staging git@heroku.com:camp-blodgett-staging.git

# Deploy local branch 'master' to staging on Heroku
git push staging master

# Deploy local branch 'acceptance' to staging on Heroku
git push staging acceptance:master
```
