# E-Mail Validator

 E-Mail Validator is an application that lets users find valid email addresses based on the contact's name and URL.

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

#### Configure Environment Variables

```
 cp .env.exampe .env
```

Update the following ENV variables required for database connection and to connect with MailBoxLayer API


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

it will run the app on this URL. Visit it and you can play with it http://localhost:3000/


* How to run the test suite

```
rails test
```

### Gems
- Used http_party gem to connect with MailBoxLayer API
- Used dotenv-rails gem to handle environment variable for development and test
- Will-paginate: Added this gem use pagination while displaying validated email lists on page

### Plugins
- Bootstrap: Used it for styling
- Toastr: Used it to show success/failure notifications

### Workflow and functionality
- On the web app, main page users can enter first_name, last_name, and URL. The validated email lists will be shown on the page and they will be updated without reloading when the user will search for validated email. If the existing one searched again, it will be moved to the top.

- Implemented pagination on the email list show page. For now, I have added a limit of 5 emails per page and then pagination will be shown


#### Note
- As I was using the Free version of MailBoxLayer API so I added a delay of 1 second between each request sent to the API. Otherwise, it's giving MaxRateLimit error due to the limitation of the free account.

- When the user enters the contact details, For now, I am only generating 6 possible combinations as mentioned in the assignment. I think it can be dynamic and we can have many other possible combinations which can be generated and validated
