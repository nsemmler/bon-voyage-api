# Bon Voyage API

### About
This repository hosts the back end of [Bon Voyage](https://github.com/nsemmler/bon-voyage-api), an application that
helps users determine *where* to travel.  Users take a short 5 question quiz, the results of which are
handled
This API was built with a PostgreSQL database

### Technologies Used
- Ruby on Rails
- Devise
- Bcrypt
- PostgreSQL
- RSpec

### Directions To Get Started Locally

Clone this repository, then from your local directory:

```bash
rake db:create
rake db:migrate
rake countries:run_all
rake db:seed
```

The countries rake tasks require access to the following APIs:
- [Bing Images API](https://azure.microsoft.com/en-us/services/cognitive-services/bing-image-search-api/)
- [Triposo API](https://www.triposo.com/api/)

You will need to register for access to these APIs and either replace the ENV variables
in /lib/tasks/countries.rake with your own token values or generate a /config/local.env.yml
where you can store your values secretly.

Every API endpoint with the exception of /login and /signup require authorization.
Simply signup and login to receive an auth token in the login response header.

Add Authorization in the header of any API request like so:
```
Authorization: "Bearer your_token"
```
