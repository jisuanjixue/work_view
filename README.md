# README


# work view code
this is an opinionated home work to build a word book web applications with Ruby on Rails and flowbite ui. It simplifies the process of setting up a new application while following best practices.

### Backend

- [Ruby](https://www.ruby-lang.org/de/) 3.2.2
- [Ruby on Rails](https://rubyonrails.org/) 7.0.6
- [PostgreSQL](https://www.postgresql.org/) for use as SQL database
- [Sidekiq](https://sidekiq.org/) for background processing
- [Redis](https://redis.io/) for Caching, ActionCable, and Sidekiq
- [Puma](https://puma.io/) is a simple, fast, multi-threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications.

### Frontend

- [hotwire](https://hotwired.dev/) Hotwire is an alternative approach to building modern web applications without using much JavaScript by sending HTML instead of JSON over the wire
- [Tailwind CSS 3](https://tailwindcss.com/) to not have to write CSS at all
- [https://flowbite.com/](https://heroicons.com/) Build websites even faster with components on top of Tailwind CSS.
- [esbuild](https://esbuild.github.io/) An extremely fast bundler for the web

### Development

- [Foreman](https://github.com/ddollar/foreman) for starting up the application locally
- [Overmind](https://github.com/DarthSim/overmind) for Process manager for Procfile-based applications and tmux
- [dotenv](https://github.com/bkeepers/dotenv) to load environment variables from .env into ENV
- [Prettier](https://prettier.io/) for auto-formatting JavaScript and Ruby code in Visual Studio Code
- Live reloading

### Linting and testing

- [RuboCop](https://rubocop.org/) for Ruby static code analysis
- [ESLint](https://eslint.org/) for JavaScript static code analysis
- [RSpec](https://rspec.info/) for Ruby testing



## Getting started

### Install for development

1. Clone the repo locally:

```bash
git clone https://github.com/jisuanjixue/work_view
cd work_view
```

1. Install PostgreSQL, Redis, ruby, gem, javascript node module etc Setup the application to install gems and NPM packages and create the database::

```bash
bin/setup
```

5. Start the application locally:

```bash
overmind start
```

Then open http://localhost:3000 in your browser.
use devise for login, username: aa11, password: 123456

### Running linters

RuboCop:

```
bin/rubocop
```

ESLint:

```
bin/yarn lint
```

### Running tests locally

Ruby tests:

```
bin/rspec
open coverage/index.html
```

JavaScript unit tests:

```
bin/yarn test
```


### Test deployment locally

```
docker network create public
docker-compose up
```

