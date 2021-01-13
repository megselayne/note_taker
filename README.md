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

|User Story|API Route|
|-|-|
|A user can create a note | `POST api/v1/note`|
|A user can see existing note titles in a sidebar|`GET api/v1/note/preview`|
|A user can see the full note in the main pannel by clicking on sidebar title|`GET api/v1/note/:id`|
|A user can edit an existing note|`PUT api/v1/note/:id`|
|A user can delete an existing note| `DELETE api/v1/note/:id`|

