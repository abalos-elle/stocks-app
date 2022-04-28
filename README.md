[![Contributors](https://img.shields.io/github/contributors/abalos-elle/stocks-app?style=for-the-badge)](https://github.com/abalos-elle/stocks-app/graphs/contributors)
[![Website](https://img.shields.io/website?down_message=OFFLINE&style=for-the-badge&up_message=ONLINE&url=https%3A%2F%2Favion-stocks-app.herokuapp.com)](https://avion-stocks-app.herokuapp.com)
![GitHub top language](https://img.shields.io/github/languages/top/abalos-elle/stocks-app?color=red&style=for-the-badge)
![GitHub followers](https://img.shields.io/github/followers/abalos-elle?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/abalos-elle/stocks-app?style=for-the-badge)

# About the Project
Stocks app is a backend project containing listings of companies and stock trends from AlphaVantage API, and utilities for you to buy and sell and manage your portfolio.
![login-screen.png](docs/login%20screen.PNG)

![stock trends.png](docs/stock%20trends.PNG)

![buy-stocks.png](docs/buy%20stocks.PNG)

![portfolio.png](docs/portfolio.PNG)

![transactions.png](docs/transactions.PNG)

![users.png](docs/users.PNG)

## Built With
### Technologies
* [Ruby on Rails Version 6.1.4.6](https://guides.rubyonrails.org/v6.1/)
* [Postgres](www.postgresql.org/)
* [JavaScript](https://www.javascript.com/)
### Third Party Packages
* [Bootstrap](https://getbootstrap.com/)
* [Devise Gem](https://github.com/heartcombo/devise)
* [Httparty](https://github.com/jnunemaker/httparty)
* [AlphaVantageRB gem by StefanoMartin](https://github.com/StefanoMartin/AlphaVantageRB)
* [Chart.js](https://www.chartjs.org/)


# Getting Started
## Prerequisites

## Installation

1. Clone the repo
   ```sh
   git clone https://github.com/abalos-elle/stocks-app.git
   ```
2. Build gems and installation packages
   ```sh
   bundle install
   yarn install
   ```
3. Get a free API key from [AlphaVantage](https://www.alphavantage.co/)
4. Enter your API key in the Rails Credentials file
   ```sh
   EDITOR="code --wait" rails credentials:edit
   ```
   Add these lines
   ```ruby
    alphavantage:
        key: <Your API key>
   ```
5. Install and run the redis server
   ```sh
   sudo apt install redis-server
   redis-server --daemonize yes
    ```
5. Check if the redis server is running
   ```sh
   redis-cli ping

   This command should return PONG
    ```    
6. Setup the database
    ```sh
    rails db:create
    rails db:migrate
    rails db:seed
    ```  
6. Run the application
    ```sh
    rails s
    ```  
