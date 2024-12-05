<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## ABOUT DOCUMENTATION FOR []()

## ALL COMMANDS EXECUTED FROM THE PARENT DIRECTORY ONLY THROUGH make
## ENTERING THE CONTAINER VIA COMMAND: log in
## EVERYTHING WE DO IN THE CONTAINER IS DONE AS A REGULAR CALL OF THOSE SERVICES (php -v, nvm -v and so on)
## BELOW IS A LIST OF ALL COMMANDS
## COMMAND make info PROVIDE ALL EXISTING COMMANDS IN THE MAKEFILE

* Uninstall old versions
* Older versions of Docker were called docker, docker.io, or docker-engine. If these are installed, uninstall them:

## Command
    sudo apt-get remove docker docker-engine docker.io containerd runc

## Install Docker Engine
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    sudo systemctl start docker

NEXT STEPS

The extension allows to:
* git clone - link to GitHub project
* copy file .env.example in .env

## Command
    cp env.example .env

NEXT STEPS

## How to install make on Ubuntu
    sudo apt-get update && sudo apt-get install make

    ls /usr/bin/make
        - If the directory is available then you can use the “make” utility; if it displays an error as shown below then there is a way to solve this problem as well:

    sudo apt install build-essential

    make -version

## Start command in bash terminal - for Docker
    make build

## next
    make start

## next login to container PHP-FPM
    make login

## OTHER COMMAND

## Generation APP_KEY hash command
    make artisan-command CMD=key:generate

## Clear cache all
    make artisan-command CMD=optimize:clear

## Generate migration table databases:
    make artisan-command CMD=migrate

## Generate seeder:
    make artisan-command CMD=db:seed

NEXT STEPS - OPENING LOCAL SITES IN BROWSER:

## Command First [default] page project Swagger documentation
    http://localhost:3015
