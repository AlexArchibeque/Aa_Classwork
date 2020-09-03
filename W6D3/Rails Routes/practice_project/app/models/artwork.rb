# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: {scope: :title}
    # validates :chirp_id, uniqueness: {scope: :liker_id}

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    # Then add associations connecting an ArtworkShare to both an Artwork and a User (name this association viewer). 
    # Add a through association shared_viewers on Artwork. Artwork#shared_viewers will return the set of users with whom an artwork has been shared.

end
