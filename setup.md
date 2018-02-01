# locale

add these lines in `config/application.rb`

```ruby
# config/application.rb
config.encoding = 'utf-8'
config.time_zone = 'Taipei'
config.i18n.default_locale = 'zh-TW'
```

# yarn

make sure `rails` read `node_modules`

```ruby
# config/initializers/assets.rb
Rails.application.config.assets.paths << Rails.root.join('node_modules')
```

make sure `bin/setup` have this

```ruby
system('bin/yarn')
```

git commit `yarn.lock` and `package.json`

.gitignore add `/node_modules` and `/yarn-error.log`

## bootstrap

```bash
$ yarn add bootstrap@4
$ yarn add jquery@3
$ yarn add popper.js
```

add these lines in `assets/javascripts/application.js`

```javascript
// assets/javascripts/application.js
//= require jquery/dist/jquery
//= require popper.js/dist/umd/popper
//= require bootstrap/dist/js/bootstrap
```

change `assets/javascripts/application.css` to `assets/javascripts/application.scss` and add

```css
/* assets/javascripts/application.scss */
@import 'bootstrap/scss/bootstrap';
```

# gems

```ruby
# form
gem 'simple_form'
# pagination
gem 'kaminari'
# role and authorization
gem 'cancancan', '~> 2.0'
gem 'rolify'
# sign in out
gem 'devise'
gem 'devise-i18n'
# env var
gem 'figaro'
```

```bash
$ bundle
```

## figaro

```bash
$ bundle exec figaro install
```

set env var at `config/application.yml`

## simple_form

```bash
$ rails g simple_form:install --bootstrap
```

## devise

```bash
$ rails g devise:install
```

set root at `config/routes.rb`

`config/environments/development.rb` add this

```ruby
# config/environments/development.rb
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

create user model

```bash
$ rails g devise User
$ rails db:migrate
```

create devise views and i18n

```bash
$ rails g devise:i18n:views
$ rails g devise:i18n:locale zh-TW
```

## rolify

create role model and belongs to user

```bash
$ rails g rolify Role User
$ rails db:migrate
```

## cancancan

create `app/models/ability.rb`

```bash
$ rails g cancan:ability
```

## kaminari

create kaminari with bootstrap4 theme

```bash
$ rails g kaminari:views bootstrap4
```
