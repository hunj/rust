# Rust Server

This is a simple Dockerfile/docker-compose config for running steamcmd with dedicated server for Rust.

Check it out by connecting to `box.hunj.tech`

## Requirements

- docker & docker-compose

## Instructions

1. Copy `.env.sample` to `.env` and fill up the information:

  ```shell
  $ cp .env.sample .env
  ```

2. Run docker-compose:

  ```shell
  $ docker-compose up -d
  ```

