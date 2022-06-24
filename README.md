![](https://img.shields.io/badge/goldensquad-orange)

# Book A Golf Course Backend

> Book A Golf Course backend is rails backend application for booking golf courses. This applications works with API endpoints and users can load, create, and delete Coursess and Add reservations. Users need to sign up or sign in to access the API endponits. They can sign up or sign in using the API endponts.

## Front End Repo

[Book Appointments Frontend](https://github.com/BenjaminSemah/capstone-front-end.git)

## Kanban Board
[Kanban Board](https://github.com/omarsalem7/capstone-back-end/projects/2)

## Initial state Of Kanban Board
[Initial Kanban Board](https://github.com/omarsalem7/capstone-back-end/issues/17)

> ***We are a group of five***
1. Team 1 - [Butler](https://github.com/butlermuwo)
2. Team 2 - [Stephan](https://github.com/sneeu-leeu)
3. Team 3 - [Josphat](https://github.com/zairdon20)
4. Team 4 - [Omar](https://github.com/omarsalem7)
5. Team 5 - [Benjamin](https://github.com/BenjaminSemah)

## Built With

- Major languages (Ruby)
- Framworks (Ruby on Rails)
- Testing library (Rspec)
- API docs (Rswag)

## Live version

[In progress]

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites
- A text editor(preferably Visual Studio Code)

### Install
- Ruby
- Ruby on Rails
- PostgresSQL

### Using it Locally

- Clone the project
```
git clone https://github.com/omarsalem7/capstone-back-end
cd capstone-back-end
```

### Setup

Install gems with:

```
bundle install
```

Setup database with:

```
rails db:create
rails db:migrate
rails db:seed
```
### Usage

Start server with:

```
rails server -p 3001
```

Visit http://localhost:3001/ in your browser.

### Run tests

Install npm with:

```
npm install
```

Install rspec with:

```
bundle install
```

and

```
rails generate rspec:install
```

run the test with:

```
rspec spec
```
### Open API documentation

```
rails rswag:specs:swaggerize
```

Visit http://localhost:3001/api-docs in your browser.