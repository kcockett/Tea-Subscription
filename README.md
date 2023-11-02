# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

With these routes in place, you can create and delete subscriptions by making appropriate requests to the corresponding endpoints. Here's a brief summary of the available routes based on your configuration:

To create a customer: POST /api/v0/customers?params
To create a subscription for a customer: POST /api/v0/subscriptions?params
To delete a subscription for a customer: DELETE "/api/v0/subscriptions/[subscription_id]?customer_id=[customer_id]"

Without user accounts and authentication, these endpoints were created such that the customer email address is used for identification, as using an ID# would allow bad actors to scour the entire database.

schema, component tree, endpoints, screenshots or gifs of the UX/UI, etc.

Expanded needs:
Customer authentication/session control for account security
Implement Cross-Origin Resource Sharing (CORS) to enhance security via access rights
Administrative user to access/manage Customers, Subscriptions, Tea products, subscription options, email campaigns, and promotions

Create API for adding a customer to the Customer database.  
`post '/api/v0/customers'`
Valid params included in the `Body` of the request as `JSON` (all fields required, email must be unique):  `{ customer: { "first_name": "first_name, "last_name": "last_name", "email": "email", "address": "address" } }`

Add dummy "Teas" data for Test and Dev environments.  All entries include `title`, `description`, `temperature`, and `brew_time`.

Add an endpoint to create a Subscription.  
`post /api/v0/customers/[customer_id]/subscriptions`
Required parameters, as JSON in the Body of the request.  Example:  `{ "subscription": { "title": "Monthly English Breakfast", "price": 7.95, "customer_id": 3, "tea_id": 5, "status": "active", "frequency_months": 1 } }`
Required information:  title(string), price(float), customer_id(integer), tea_id(integer), status(string), frequency_months(integer)

Create an API for canceling a subscription:
`patch /api/v0/customers/[customer_id]/subscriptions/[subscription_id]  `
Required params as `JSON` in the `Body` of the request: `{ "subscription": { "status": "cancel"}}`

Create API to retrieve a list of all subscriptions for a given customer, both active and canceled.
`get /api/v0/customers/[customer.id]/subscriptions`

