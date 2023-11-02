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



schema, component tree, endpoints, screenshots or gifs of the UX/UI, etc.



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

=================================

#OVERVIEW:
App for Tea subscription with several APIs:
1. Get tea info
2. Add customer
3. Add subscription
4. Cancel subscription
5. Get customer subscriptions

##Talking points:

**Challenges:**

1. Overthinking initial design concept:  What is a subscription?  One tea or curated collection? Blind Box?
2. Overthinking security concerns:  Hide ID numbers, add user authentication, add API key, non-RESTful routes, GraphQL?
3. Sourcing tea information:  Spoontacular API process, sort through documentation, Search external resources for Spoontacular integration, find different source that provides required information?

**Future Development**

1. Customer authentication/session control for account security
2. Implement Cross-Origin Resource Sharing (CORS) to enhance security via access rights
3. Administrative user to access/manage Customers, Subscriptions, Tea products, subscription options, email campaigns, and promotions
4. Create User Stories for clarifying project requirements.  Collaborate with Project Managers and Front End developers for this information
5. Add User Stories to Project Board to track ongoing development


**To Do list:**

1. Add tests for data structure
2. Complete Readme details