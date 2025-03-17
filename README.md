# URL Shortener

A simple URL shortener built with Ruby on Rails.

## 🚀 Features
- Shortens long URLs using SecureRandom algorithm
- Copy shortened URLs to clipboard
- Validation for valid URLs
- List of previously shortened URLs
- Error handling using Javascript
---

## 🛠️ Setup Instructions

### 1 Prerequisites
Ensure you have the following installed:
- Ruby (>= 3.0.0 recommended)
- Rails (>= 8.0.2 recommended)
- SQLite (for local development)
- Bundler

### 2 Clone the Repository
```sh
git clone https://github.com/kalikumar-n/url_shortner.git
cd url-shortener
```

### 3 Install Dependencies
```sh
bundle install
```

### 4 Setup the Database
```sh
rails db:create
rails db:migrate
rails db:seed
```

### 5 Start the Server
```sh
rails server
```
Open [http://localhost:3000](http://localhost:3000) in your browser.

---

## 🧪 Running Tests

### 1 Install Test Dependencies
```sh
gem install rspec-rails rails-controller-testing\```
group :test do
  gem 'rspec-rails'
  gem 'rails-controller-testing'
end
```
Then run:
```sh
bundle install
rails generate rspec:install
```

### 2 Run Tests
```sh
rspec
```
To run a specific test file:
```sh
rspec spec/controllers/short_urls_controller_spec.rb
```

---
