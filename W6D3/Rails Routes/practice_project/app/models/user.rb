# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    # validates :username, :email, presence: true, uniqueness: true

    has_many :art_pieces,
        foreign_key: :artist_id,
        class_name: :Artwork

    has_many :artwork_shares, #viewer
        foreign_key: :viewer_id, 
        class_name: :ArtworkShare

    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork

    # Then add associations connecting an ArtworkShare to both an Artwork and a User (name this association viewer). 
    # Add a through association shared_viewers on Artwork. Artwork#shared_viewers will return the set of users with whom an artwork has been shared.
end
