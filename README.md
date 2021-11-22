# Amazing Gud Read

## Requirements

Ruby 3.0 and above.

## Setup

**NOTE**: On Linux, to install `mysql2` gem, you need to run this command first.

```sh
sudo apt-get install libmysqlclient-dev
```

Windows users, you're on your own.

## Start MySQL server

Run `docker-compose up -d` to start MySQL container. If you would like to change MySQL config for this Rails app, see `config/database.yml`.
