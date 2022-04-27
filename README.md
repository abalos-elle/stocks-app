# About the Project
Stocks app is a backend project containing listings of companies and stock trends from AlphaVantage API, and utilities for you to buy and sell and manage your portfolio.
[![login-screen.png](https://i.postimg.cc/vHnhd0Q2/login-screen.png)](https://postimg.cc/nCHB4Y9q)

[![stock-trends.png](https://i.postimg.cc/CxFq67dq/stock-trends.png)](https://postimg.cc/WhHzdMGN)

[![buy-stocks.png](https://i.postimg.cc/hv2B4Kbg/buy-stocks.png)](https://postimg.cc/7JJcm8WQ)

[![portfolio.png](https://i.postimg.cc/qq55Zqxt/portfolio.png)](https://postimg.cc/Wq08d2Kj)

[![transactions.png](https://i.postimg.cc/jSzMyZmn/transactions.png)](https://postimg.cc/rDwGkC8q)

[![users.png](https://i.postimg.cc/7PjvVtsK/users.png)](https://postimg.cc/Z0PDYHhN)

## Built With
* [Ruby on Rails](https://guides.rubyonrails.org/)
* [Postgres](www.postgresql.org/)
* [JavaScript](https://www.javascript.com/)
* [Bootstrap](https://getbootstrap.com/)
* [Devise Gem](https://github.com/heartcombo/devise)


# Getting Started
## Prerequisites
This is an example of how to list things you need to use the software and how to install them.
* Build gems
  ```sh
  bundle install
  ```
* Bootstrap
  ```sh
  yarn add bootstrap
  yarn add @popperjs/core
  ```
## Installation
1. Get free API key from [AlphaVantage](https://www.alphavantage.co/)
2. Clone the repo
   ```sh
   git clone https://github.com/abalos-elle/stocks-app.git
   ```
3. Enter the API key in the Rails Credentials file
   ```sh
   EDITOR="code --wait" rails credentials:edit

   Add these lines

    alphavantage:
        key: 8ONFPYTT5A16Y8RT
   ```