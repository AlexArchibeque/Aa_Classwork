# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
ArtworkShare.destroy_all
Artwork.destroy_all

#  Users
#  username   :string           not null

william = User.create!(username: 'William Turner')
leonardo = User.create!(username: 'Leonardo Da Vinci')
mnm = User.create!(username: 'Martial Matthers')

#  Artworks
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null

sunrise = Artwork.create!(title: 'Sunrise', image_url: 'google.com/sunrise', artist_id: william.id)
mona_lisa = Artwork.create!(title: 'Mona Lisa', image_url: '/lisa', artist_id: leonardo.id)

slim_show = Artwork.create!(title: 'The Good One', image_url: '/parental_advisory', artist_id: mnm.id)

#  ArtworkShares
#  artwork_id :integer          not null
#  viewer_id  :integer          not null

ArtworkShare.create!(artwork_id: mona_lisa.id, viewer_id: mnm.id)
ArtworkShare.create!(artwork_id: slim_show.id, viewer_id: william.id)

## Where we stopped
#