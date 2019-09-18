# X-Sunit

First of all I want to thanks the opportunity given by the Gocase Team to show what I could achieve in 10 days on this challenge.
A Ruby on Rails API that stores information to help the Pokemons in an alien apocalypse.

# Problem Description
The world as we know it has fallen into an apocalyptic scenario. An alien invasion is abducting humans and swapping them for evil clones that look really similar to the original person.

You, as a X-SUNIT member (and the last survivor who knows how to code), was designated to develop a system to share resources between non-abducted humans.

For more description about this challenge, click [here](https://github.com/kimlima/gocase-backend-challenge-internship)

# What can my project do?
I create an API REST that renders the output as json. It currently contains the v1 of the api, future releases may are coming!

I developed 3 models, one for the survivors, one for the location and one for the flags. Using the methods belongs_to,has_many and has_one , it was quite easy to establish the relation one to many association, between the survivors/flags and the one to one association between survivors/location.

You can create a new survivor, see all the survivors informations and his condition (safe or abducted), see informations for a specified survivor, update a survivor location and give a flag for a specified survivor. With 3 or more flags that survivor become abducted. You can also see on the reports the percentage of abducted and safe survivors, and a list of survivors name and his condition.


# Dependencies

## Ruby version
2.5.6p201
## Rails version
Rails 6.0.0
## MySQL version
10.1.38-MariaDB

# How to use it
After installing all the dependencies.
Help the pokemons, fast!!!

1. Clone the repository
    
    $ git clone https://github.com/matsales28/gocase-xsunit

2. Install dependencies

    $ bundle install

3. Create a new schema called xsunit or change [database.yml](config/database.yml) to your database:

4. Run migrations

    $ rake db:migrate

5. Seed the database

    $ rails db:seed

6. Run the local server

    $ rails s

## Learning Ruby on Rails and Building an API REST

Yeah, it was my first time doing the two things above, never ever had did a API REST and never ever had contact with Ruby. It was a true challenge for me to did this project, but finishing it makes me so proud of what I have accomplished in just 10 days of practice, hard work, and study(and some hours lost of sleep).


## What did I do?

I create an API REST that renders the output as json. It currently contains the v1 of the api, future releases may are coming!
I developed 3 models, one for the survivors, one for the location and one for the flags. Using the methods belongs_to,has_many and has_one , it was quite easy to establish the relation one to many association, between the survivors/flags and the one to one association between survivors/location.



### Conditions to abduction

To flag a survivor as abducted, it's necessary a survivor and a flagger id. There are a few moments that you can't flag a survivor as abducted.
1. When the survivor_id and the flagger_id are equals.(Are you an alien? Or an crazy pokemon?)
2. When an abducted survivor tries to flag another survivor.(I am really thinking you are an alien.)
3. When you try to report the same flag twice.(Ok,ok you are just a crazy pokemon.)

After validate this conditions, if you are receiving your third report then your status changes to abducted.

Check the function validateTheFlag on [side_functions.rb](app/controllers/api/v1/side_function.rb)
Also check [flags_controller.rb](app/controllers/api/v1/flags_controller.rb) for more infos.

# Documentation

All the documentation can be see at this Postman collection [here](https://documenter.getpostman.com/view/8462018/SVmwuxE9?version=latest)


# To improve
1. Implement auth
2. Track some dangerous locations to help the survivors pokemons
3. Better refactor and modularization of the code
