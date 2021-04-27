# Notes

This document describes the thought process behind the development of this
repository. It should provide a peek into the reasoning behind the changes code.

Let's get this started! There should be page that allows users to:

- Create a trade
- Verify if the trade is fair or not
- Save the trade for future reference
- See all past trades

The overall development plan should look like this:

1. Implement trade fairness back-end
  - This should a single endpoint that receives a bunch of pokémon for trade
    and returns whether the trade is fair or not or if there is a problem with it
1. Implement history front-end
  - Includes implement models and methods to store and retrieve trades
1. Implement trade front-end
  - This should allow users to create a trade by:
    - Listing pokémon
    - Adding pokémon to their side of the trade
  - After the trade is created, the users should be able to click a
    "Verify button" and see if the trade is valid or not.
1. Implement trade history front-end
  - Once the trade is implemented, there should be a button somewhere allowing
    users to save their trade.
  - There should be a list displaying previous trades. Selecting one of these
    trades would replace the current trade with the selected one.

Regarding technology choice:

- I will use Ruby on Rails because
  - This project needs to coordinate a front-end with a back-end and Rails is
    pretty good at that
  - I need to deploy this to Heroku and Heroku and Rails are best buddies
  - That's what the company already uses
- I will use Heroku because
  - I already know how to use it and so does the company
  - It offers me the chance to use PostgreSQL basically for free which is really
    good for testing purposes.

## Basic Setup

- [x] Setup Ruby on Rails
  - The [RailsGirls tutorial](http://guides.railsgirls.com/install) and
  this [DigitalOcean tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04)
  may be used to setup Rails
- [x] Setup Heroku
  - The app should be available [here](https://liberdade-poketrade.herokuapp.com)

## Trade Fairness System

Once Rails is up, I will start by implement the trade back-end, this should be
the most important feature of this system so it goes first.

1. Implement pokémon information system
  - This should list all available pokémon and display the `base_experience`
    for each pokémon species
1. Implement system to verify whether a trade is fair or not
  - This should receive two lists of pokémon;
  - This should return whether the trade is fair or not, or if there is a
    problem with the proposed trade
1. Implement endpoint to consume the trade fairness system
  - This endpoint should receive the aforementioned lists and return the
    desired information

I will complete the following tasks to accomplish these goals:

- [x] ~~List all available pokémon~~
  - I will leave this feature for the future so I can move faster right now.
- [x] Provide the `base_experience` for each pokémon
- [ ] Check whether a list of pokémon is valid
  - The list should contain only existing pokémon names
  - The list should have more than 0 and less than 6 pokémon
- [x] Verify if a trade is valid or not
  - A trade is valid if
    - Both pokémon lists to trade are valid
    - The sum of `base_experience` for both lists are similar
      - In this case, let `A, B` be pokémon lists. I will define similar if
        `|sum(A)-sum(B)| < 10% (sum(A) + sum(B))` holds.
- [x] Create a controller with the pokémon information

Once the trade fairness system is working, I will implement the front-end:

- [x] Create page to create a pokémon trade
- [x] Consume fairness API to indicate whether a pokémon trade is fair or not
- [x] Deploy trade fairness system to Heroku

Please note the implementation details:

- There is a helper module called `PokemonInfo` that handles all information
  related to Pokémon.

## Trade History

Now that the fairness system is implemented, it's time to implement the trade
history system. This should store the valid, verified trades in the database
and display them on the main page.

- [x] Create `Trade` model on database
- [ ] Create methods to store and retrieve trades
- [ ] Display trades on front-end
