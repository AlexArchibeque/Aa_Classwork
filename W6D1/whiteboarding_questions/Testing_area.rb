Given the following Schema:

#ruby

# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer
#

Write two SQL Queries:

1.  List the films where 'Harrison Ford' has appeared - but not in the star
    role.
    - **Note:** the `ord` field of casting gives the position of the actor. If
      `ord=1` then this actor is in the starring role

SELECT
    movies.*
FROM
    movies
JOIN castings ON castings.movie_id = movies.id
JOIN actors ON castings.actor_id = actors.id
WHERE
    actors.name = 'Harrison Ford' AND
    castings.ord != 1;

SELECT
    movies.title
FROM
    movies
JOIN
    castings ON castings.movie_id = movies.id
JOIN
    actors ON actors.id = castings.actor_id
WHERE
    (actors.name = 'Harrison Ford' AND castings.ord != 1);


2.  Obtain a list in alphabetical order of actors whove had at least 15
    starring roles.

SELECT
    actors.name
FROM
    movies
JOIN castings ON castings.movie_id = movies.id
JOIN actors ON castings.actor_id = actors.id
WHERE
    castings.ord = 1
GROUP BY
    actors.id
HAVING
    COUNT(*) >= 15
ORDER BY
    actors.name;

 SELECT
    actors.name
FROM
    actors
JOIN
    castings ON castings.actor_id = actors.id
WHERE
    castings.ord = 1
GROUP BY
    actors.name
HAVING
    COUNT(*) >= 15
ORDER BY
    actors.name;


Identify the difference between a `has_many through` and a `has_one`
association?

a Has many through assosciation goes through other assosciations joining together
multiple tables to paint a more complex picture.

Has_one returns a limited of 1 assosciation.


## Question Seven

Given the following table write all the `belongs_to` and `has_many` associations
for models based on the below table (`User`, `Game`, and `Score`)

ruby
# == Schema Information
#
# Table name: user
#
#  id   :integer          not null, primary key
#  name :string           not null

class User < ApplicationRecord
    has_many :scores,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Score

    has_many :games,
        primary_key: :id,
        foreign_key: :game_maker_id,
        class_name: :Game

end


# Table name: score
#
#  id   :integer           not null, primary key
#  number :integer         not null
#  user_id :integer        not null
#  game_id :integer        not null

class Score < ApplicationRecord
    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :game,
        primary_key: :id,
        foreign_key: :game_id,
        class_name: :Game
end


# Table name: game
#
#  id   :integer           not null, primary key
#  name :string            not null
#  game_maker_id :integer  not null

class Game < ApplicationRecord

    has_many :scores,
        primary_key: :id,
        foreign_key: :game_id,
        class_name: :Score

    belongs_to :maker,
        primary_key: :id,
        foreign_key: :game_maker_id,
        class_name: :User
end