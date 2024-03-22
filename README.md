# SwiftLink API

SwiftLink is a URL shortener API that allows users to shorten long URLs into more manageable and shareable links. This API provides endpoints for creating, retrieving, updating, and deleting shortened links.

Our API uses Ruby on Rails, your device will need it installed to the latest version of rails 7
## Getting started
First you will havr to clone this repository using the following commands
```bash
git clone
```
Then move into the directory of the cloned repository
```bash
cd ls-backend-api
```
Install the required dependencies and ruby gems which are crucial to the running of the project
```bash
bundle
```
Set up the database with 
```ruby
rails db:migrate
```

Start the rails server with 
```ruby
rails s
```

## Usage
This API runs on port 3000 of your local device and the react client side runs on port 3001, the client side uses port 3000 for the endpoints, you willl find it as API_BASE_URL in the react app, you can change it if it is deployed

## Endpoints

### Create a Shortened Link

- **URL:** `/s/:slug`
- **Method:** `POST`
- **Description:** Creates a shortened link.
- **Parameters:**
  - `slug` (optional): The custom slug for the shortened link. If not provided, a random slug will be generated.
  - `url` (required): The long URL to be shortened.


### Get all shortened links
- **URL** `/s`
- **Method** `GET`
- **Description** Fetches all shortened links and their data such as the original link and the time it was created and/or updated




