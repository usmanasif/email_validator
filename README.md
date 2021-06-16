# E-Mail Validator

 E-Mail Validator is an application that lets users find valid email addresses based on the contact's name and url.

example:
first_name: Ben
last_name: Pratt
url: 8returns.com


Based on the user's input, it will generate following email combinations:
1. ben.pratt@8returns.com
2. ben@8returns.com
3. benpratt@8returns.com
4. pratt.ben@8returns.com
5. b.pratt@8returns.com
6. bp@8returns.com



## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing


* Ruby version
 ruby-2.6.7

```
 rvm install 2.6.7
```
* Database
postgresql

```
brew install postgres
```


* Clone the repository


```
git clone https://github.com/usmanasif/email_validator.git
cd email_validator
bundle install
```

### Configure Enviroment Variables

```
 cp .env.exampe .env
```

Update the following ENV variables required for database connection and  to connect with MailBoxLayer api

```
MAIL_BOX_LAYER_ACCESS_KEY=e412e9c540ba6aaed4739c05ddca0cb8
DB_HOST=localhost
DB_NAME=email_validator_development
DB_USER=postgres_user
DB_PASSWORD=postgres_password
```



* Database creation

```
  rails db:create
  rails db:migrate
```
* Run app locally on 3000 port

```
rails server
```

it will run the app on this url. Visit it and you can play with it
http://localhost:3000/

* How to run the test suite

```
rails test
```

### Gems
- Used http_party gem to connect with MailBoxLayer api
- Used dotenv-rails gem to handle environment variable for development and test

### Plugins
- Bootstrab: Used it for styling
- Toastr: Used it to show success/failure notifications

### Workflow and functionality
- On web app main page users can enter first_name, last_name and url.  The validated email lists will be shown on page and it will be updated without reloading when user will search for validated email.  If existing one searched again, it will be moved to top


#### Note
As I was using Free version of  MailBoxLayer api so I added a delay of 1 seconds between each request sent to the api. Otherwise it's giving MaxRateLimit error due limitation of free account.

