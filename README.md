# BxBlue Challenge

> Create a system to identify if a pokémon trade is fair or not

About the challenge:

- The system should be available on Heroku and the source code, on GitHub.
- The [PokeAPI](https://pokeapi.co/docs/v2) may be used to verify the stats.
- There should be a log with the trade history
- It is suggested to use the `base_experience` to verify fairness.

The application is available [here](https://liberdade-poketrade.herokuapp.com).

Progress is documented [here](./docs/notes.md).

## Quick Start

First, install the development dependencies. These depend on the OS you are
running:

- [Ruby on Rails](http://guides.railsgirls.com/install)
- [Yarn](https://yarnpkg.com)
- [PostgreSQL](https://www.postgresql.org)

If you are using Homebrew, be sure to get PostgreSQL running beforehand:

```
brew services start postgresql
```

Once Rails is installed, run the following commands to install the Rails
dependencies and prepare the database:

```
bundle install
rails db:migrate
```

To get the server running, execute:

```
rails server -e development
```

To run the unit tests:

```
rails test -e development
```
