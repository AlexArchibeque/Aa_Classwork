# create_table "movies", force: :cascade do |t|
#   t.string "title", null: false
#   t.integer "yr", null: false
#   t.float "score", null: false
#   t.integer "votes", null: false
#   t.integer "director_id", null: false
#   t.index ["director_id"], name: "index_movies_on_director_id"
#   t.index ["title"], name: "index_movies_on_title"
# end

class Movie < ApplicationRecord
  belongs_to(:director, { class_name: :Actor, foreign_key: :director_id, primary_key: :id })

  has_many :castings,
    class_name: :Casting,
    foreign_key: :movie_id,
    primary_key: :id

  has_many :actors,
    through: :castings,
    source: :actor

  # return an array of all movies {ID, movie title, score <= 3.0}
  # all movies with score <= 3.0


  # SELECT id,title,score
  # FROM movies
  # WHERE score <= 3.0

end
