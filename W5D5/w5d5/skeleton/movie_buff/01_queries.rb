def it_was_ok
  # Consider the following:
  #
  # Movie.where(yr: 1970..1979)
  #
  # We can use ranges (a..b) inside a where method.
  #
  # Find the id, title, and score of all movies with scores between 2 and 3
  Movie.select(:id, :title, :score).where("score between 2.0 and 3.0")
  #Movie.select(:id, :title, :score).where('score BETWEEN 2.0 AND 3.0')
end

# SELECT id,title,score
# FROM movies
# WHERE score BETWEEN 2.0 AND 3.0

# def it_was_ok
#   Movie.select(:id, :title, :score).where('score <= 3.0')
# end

# def it_was_ok_bad
#   movies = Movie.all # 1
#   new_arr = []
#   movies.each do |mov| # n
#     new_arr << mov.select(*)
#   end
# end

def harrison_ford
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .where(movies: { title: 'Blade Runner' })
  #
  # It's possible to join based on active record relations defined in models.
  #
  # Find the id and title of all movies in which Harrison Ford
  # appeared but not as a lead actor

  # SELECT DISTINCT movies.id , movies.title
  # FROM movies
  # JOIN castings ON movies.id = castings.movie_id
  # JOIN actors ON castings.actor_id = actors.id
  # WHERE name LIKE 'Harrison Ford' AND castings.ord != 1
  
  Movie
    .select(:id,:title)
    .joins(:actors)
    .where(actors: {name: 'Harrison Ford'}) 
    .where.not(castings: {ord: 1})

  # Movie.select(:id,:title).joins(:actors).where(actors: {name: 'Harrison Ford'}).where.not(castings: {ord: 1})

  # Movie.select(:id,:title).joins(:actors).where("actors.name LIKE 'Harrison Ford'").where('castings.ord > 1')
  
end

def biggest_cast
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .group('actors.id')
  #   .order('COUNT(movies.id) DESC')
  #   .limit(1)
  #
  # Sometimes we need to use aggregate SQL functions like COUNT, MAX, and AVG.
  # Often these are combined with group.
  #
  # Find the id and title of the 3 movies with the
  # largest casts (i.e most actors)

  # SELECT movies.id, movies.title
  # FROM movies
  # JOIN castings ON movie.id = castings.movie_id
  # GROUP BY actors.id
  # HAVING

end

def directed_by_one_of(them)
  # Consider the following:
  #
  # Movie.where('yr IN (?)', years)
  #
  # We can use IN to test if an element is present in an array.
  #
  # ActiveRecord gives us an even better way to write this:
  #
  # Movie.where(yr: years)
  #
  # Find the id and title of all the movies directed by one of 'them'.

end

def movie_names_before_1940
  # Consider the following:
  #
  # Movie.where('score < 2.0').pluck(:title)
  # => ['Police Academy: Mission to Moscow']
  #
  # Pluck works similarly to select, except that it converts a query result
  # directly into a Ruby Array instead of an ActiveRecord object. This can
  # improve performace for larger queries.
  #
  # Use pluck to find the title of all movies made before 1940.

end