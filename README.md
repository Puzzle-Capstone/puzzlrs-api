![rails-badge](https://img.shields.io/badge/Rails-5.2.6-informational?style=flat-square) ![ruby-badge](https://img.shields.io/badge/Ruby-2.7.2-informational?style=flat-square)

The average puzzle enthusiast builds their new puzzle once and then tucks it away for the rest of time. This Backend/API aims to solve this. This combined with our frontend, bulds an application that allows users to list their puzzles and request to trade with other users. As soon as you request a puzzle or someone requests your puzzle and email is sent out to the puzzles owner and notifies them that their puzzle has been requested. From here they can either approve or deny the trade, following which another email is sent out to the requestee notifying them of the decision. This simultaneously stops puzzles from sitting around unused and gives puzzlers the much desired new puzzles. The front end of the application can be reached at: [Frontend](puzzlrs.surge.sh) and the backend of the application can be reached at [Backend](https://puzzlrs.herokuapp.com/)

#### What can I do on Puzzlrs?
  - Add puzzles to your account with information such as:
    - Image of the puzzle
    - Category
    - Number of pieces
    - Number of missing pieces
    - Quality
    - The original price
  - Browse other users puzzles and find some you like
  - Request another users puzzle
  - If accepted by the user, trade puzzles!

#### Stack
- Ruby on Rails, RSpec, Heroku, CircleCI, PostgreSQL, Sidekiq
- Some of the gems: redis, pry, simplecov

# Readme Content
- [Local Setup](#local-setup)
- [Database Schema](#database-schema)
- [Endpoints](#enpoints)
- [Contributors](#contributors)

# Local Setup
- Versions
  - Rails 5.2.6
  - Ruby 2.7.2
- Fork and clone the repository
- `cd` in your local repo version and run the following commands
  - To install gems:
    -  `bundle` (if this fails, try to `bundle update` and then retry)
  - To setup database:
    - `rails db:create`
    - `rails db:migrate`
    - `rails db:seed`
- Run your own development server:
  - `rails s`
  - BackEnd local server address is:  "http://localhost:3000"
  - Run the Redis server with `redis-server`
  - Run Sidekiq with `bundle exec sidekiq`

# Database Schema
![screen_shot_2022-02-02_at_4 56 34_pm](https://user-images.githubusercontent.com/87393003/154370766-73b75081-9a76-41d7-932f-2e449019139e.png)

# Endpoints

Gets all of the Puzzles
 - GET    /api/v1/puzzles

Creates a new Puzzle
 - POST   /api/v1/puzzles

Gets one puzzle based on the given ID
 - GET    /api/v1/puzzles/:id

Deletes one Puzzle based on the given ID
 - DELETE /api/v1/puzzles/:id

Gets one User based on the given ID
 - GET    /api/v1/users/:id

Creates a new request
 - POST   /api/v1/requests

Edits the status of the given request
 - PATCH  /api/v1/requests/:id

Deletes one request based on the given ID
 - DELETE   /api/v1/requests/:id


# Contributors
- Micha Bernhard   |  [Github](https://github.com/michab17)   |   [LinkedIn](https://www.linkedin.com/in/micha-bernhard/)
- Chloe Price   |  [Github](https://github.com/chloell5)   |   [LinkedIn](https://www.linkedin.com/in/chloe-price-1705//)

