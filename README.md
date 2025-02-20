# IMCG

[![Codeship Status for thdurante/imcg](https://app.codeship.com/projects/94439060-3549-0136-4003-2e313bb7fea9/status?branch=master)](https://app.codeship.com/projects/289285)
[![codecov](https://codecov.io/gh/thdurante/imcg/branch/master/graph/badge.svg?token=Rv9o8FaZgO)](https://codecov.io/gh/thdurante/imcg)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/bf1366f263e74e0ca754c2ffd1729c79)](https://www.codacy.com?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=thdurante/imcg&amp;utm_campaign=Badge_Grade)

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
