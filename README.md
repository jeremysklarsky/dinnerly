[![Code Climate](https://codeclimate.com/github/jeremysklarsky/dinnerly/badges/gpa.svg)](https://codeclimate.com/github/jeremysklarsky/dinnerly)

# Approvable Feast

Approvable Feast is an interactive potluck planner that allows users to select an array of recipe options for each course, then invite guests to vote for the favorites and choose a dish to bring to the party.

## Features

* Dual user authentication systems, one built from scratch and one via [OmniAuth Facebook](https://github.com/mkdynamic/omniauth-facebook)
* Recipe information parsed from [Big Oven API](http://api.bigoven.com/)
* Implements custom-built voting system, with upvote and downvote functionality 
* Allows users to schedule email notifications via ActionMailer with custom Rake task and [Heroku Scheduler](https://devcenter.heroku.com/articles/scheduler)

## Usage

1. Sign up or log in to create a dinner party.  
2. Select from a list of cuisines and set the number of dishes you want to serve at your dinner party. We'll suggest a bunch of recipes for you to choose from.  
3. Invite your friends and let them vote on which dishes they'd like to enjoy at your dinner party - or you can choose to set the menu yourself.  
4. Guests receive email invitations with a link to RSVP then vote on dishes. Only invited guests can RSVP, and only RSVP'd guests can vote.
5. Once the menu for your dinner party been finalized, your guests can sign up to bring the dishes they'd like to cook.  


## Development/Contribution

Approvable Feast is an on-going work in progress, and contributions are welcome. Please consider:

- Refactoring complex code  
- Adding [test specs](https://robots.thoughtbot.com/how-we-test-rails-applications)  
- Squashing a bug  
- Fixing a typo  
- Correcting [style](https://github.com/styleguide/ruby)  

When contributing, please first:

- [Fork the project.](https://github.com/jeremysklarsky/dinnerly/fork)  
- [Commit your changes](https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message). When debugging, include a failing test case.  
- [Submit a pull request](https://github.com/jeremysklarsky/dinnerly/pulls) with _at least one_ animated GIF.  
- Patiently await our merge + eternal gratitude.  


## Future

- Add abililty to re-generate course options  
- Refine recipe parsing method (filter out low rated / incomplete recipes, etc.)  
- Add ability to filter menu options for vegetarian, gluten-free, food allergies, etc.  
- Add social features, such as chat & SMS notifications  
- Improve test suite  


## Authors

Team Approvable Feast is [Sophie DeBenedetto](https://github.com/SophieDeBenedetto), [Rachel Nackman](https://github.com/rnackman), [Jeremy Sklarsky](https://github.com/jeremysklarsky), and [Kate Travers](https://github.com/ktravers).


## License

Approvable Feast is MIT Licensed. See LICENSE for details.
