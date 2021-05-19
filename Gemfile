source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.4"
gem "rails", "5.2.3"

gem "bootsnap", ">= 1.1.0", require: false
gem "jbuilder", "~> 2.5"
gem "pg"
gem "puma", "~> 4.3"
gem "sass-rails", "~> 5.0"
gem "sneakers", "~> 2.11.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "dotenv-rails"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
end
