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
To delete a subscription for a customer: DELETE /api/v0/subscriptions?params

Without user accounts and authentication, these endpoints were created such that the customer email address is used for identification, as using an ID# would allow bad actors to scour the entire database.