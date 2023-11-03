# README

## Overview

This is an example take-home project as may be presented during an interview process for a software development position.  

This project creates a Rails API for a Tea Subscription Service

The implementation includes:

1. An endpoint to see full details of the teas in the database
2. An endpoint to add a Customer to the database
3. An endpoint to subscribe a customer to a tea subscription
4. An endpoint to cancel a customer’s tea subscription
3. An endpoint to see all of a customer’s subsciptions (active and cancelled)


## Requirements

* Ruby version 3.2.2+
* Rails version 7.0+
* PostgresQL 1.1+

## Installation

* Clone the respository at [https://github.com/kcockett/tea_subscription](https://github.com/kcockett/tea_subscription)
* From your terminal run the following commands in order:
> 1. `bundle install`
> 2. `rails db:{create,migrate,seed}`

## Database schema
![Database schema](/public/images/tea-subscription.png)

## Run the test suite

To run the complete test suite, after completing the Installation above, in Terminal, run the following command:  `bundle exec rspec spec`

## Start the service to test the APIs locally

To test the APIs locally, start the Rails server (`rails s`) and use [Postman](https://postman.com) or other similar tool to test the APIs as documented below

## API library

1. **List all Teas**
`GET /api/v0/teas`
Expected response: 
`[
    {
        "id": 1,
        "title": "English Breakfast Tea",
        "description": "A classic black tea blend known for its robust and full-bodied flavor. It's often enjoyed with milk and sugar.",
        "temperature": "200",
        "brew_time": "3",
        "created_at": "2023-11-02T23:00:26.867Z",
        "updated_at": "2023-11-02T23:00:26.867Z"
    },
    {
        "id": 2,
        "title": "Green Tea",
        "description": "A light and refreshing tea with a grassy, vegetal flavor. Green tea is rich in antioxidants and is known for its health benefits.",
        "temperature": "175",
        "brew_time": "2",
        "created_at": "2023-11-02T23:00:26.869Z",
        "updated_at": "2023-11-02T23:00:26.869Z"
    },...`

2. **Add a Customer**
`POST /api/v0/customers`
Required parameters in the `Body` of the request as `JSON`: 
`{
  "customer": {
    "first_name": "John",
    "last_name": "Smith",
    "email": "john@smith.com",
    "address": "123 Any Street, Any Town, USA"
  }
}`
Example response:
`{
  "customer": {
    "id": 1,
    "first_name": "John",
    "last_name": "Smith",
    "email": "john@smith.com",
    "address": "123 Any Street, Any Town, USA"
  }
}`

3. **Add Subscription**
`POST /api/v0/customers/[customer_id]/subscriptions`
Required parameters in the `Body` of the request as `JSON`: 
`{ "subscription": {
    "title": "Monthly English Breakfast", 
    "price": 7.95,
    "tea_id": 1, 
    "status": "active", 
    "frequency_months": 1 
    } 
}`
Example response:
`{
    "id": 1,
    "title": "Monthly English Breakfast",
    "price": 7.95,
    "status": "active",
    "frequency_months": 1,
    "customer_id": 1,
    "tea_id": 1,
    "created_at": "2023-11-02T23:00:45.211Z",
    "updated_at": "2023-11-02T23:00:45.211Z"
}`
4. **Get all Subscriptions for a Customer**
`GET /api/v0/customers/1[customer_id]/subscriptions`
Example Response:
`[
    {
        "id": 1,
        "title": "Monthly English Breakfast",
        "price": 7.95,
        "status": "active",
        "frequency_months": 1,
        "customer_id": 1,
        "tea_id": 1,
        "created_at": "2023-11-02T23:00:45.211Z",
        "updated_at": "2023-11-02T23:00:45.211Z"
    },
    {
        "id": 2,
        "title": "Bi-monthly Green Tea",
        "price": 6.95,
        "status": "active",
        "frequency_months": 2,
        "customer_id": 1,
        "tea_id": 2,
        "created_at": "2023-11-02T23:00:52.721Z",
        "updated_at": "2023-11-02T23:00:52.721Z"
    }
]`
5. **Cancel a Customer Subscription**
`/api/v0/customers/[customer_id/subscriptions/[subscription_id]`
Required parameters in the `Body` of the request as `JSON`:
`{ "subscription": { 
    "status": "cancel"
    }
}`
Expected response:
`{
    "message": "Subscription successfully canceled"
}`

## Author
Kaina Cockett [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/kcockett) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/kcockett/)
