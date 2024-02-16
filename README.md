# SwiftLink API

SwiftLink is a URL shortener API that allows users to shorten long URLs into more manageable and shareable links. This API provides endpoints for creating, retrieving, updating, and deleting shortened links.

## Getting Started

To get started with SwiftLink, follow these steps:

1. Clone the repository to your local machine.
2. Install dependencies.
3. Set up the database.
4. Start the Rails server.

## Usage
The SwiftLink API has the following end points

## Endpoints

### Create a Shortened Link

- **URL:** `/s/:slug`
- **Method:** `POST`
- **Description:** Creates a shortened link.
- **Parameters:**
  - `slug` (optional): The custom slug for the shortened link. If not provided, a random slug will be generated.
  - `url` (required): The long URL to be shortened.
- **Example:**
  ```bash
  curl -X POST -H "Content-Type: application/json" -d '{"url":"https://example.com"}' http://localhost:3000/s/:slug





