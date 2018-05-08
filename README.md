# IMCG

Support system for strategic areas surrounding the IMCG church's activities.

## Setup

In the project's root directory:
```
$ bundle install
$ rails db:create
$ rails db:migrate
```
Ruby: `2.5.1`
Rails: `5.2.0`

## Run

In the project's root directory:
```
$ sidekiq -C config/sidekiq.yml
$ rails s
```

## Test

In the project's root directory:
```
$ [coverage=on] bundle exec rspec
```
Where `coverage=on` is optional and determines whether or not the coverage report must be generate.
