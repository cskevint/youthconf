95 Youth Conferences
=========

## Install Postgresql

    $ brew install postgresql

## Install RVM

    $ curl -L https://get.rvm.io | bash -s stable --ruby
    
## Setup the Database
    
    $ rake db:create:all
    $ rake db:migrate
    $ rake db:seed
    
## Run Rails Server

    $ rails server
