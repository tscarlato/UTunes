class Cassette < ApplicationRecord
    has_many :songs, dependent: :destroy
    validates :title, presence: true,
    length: { minimum: 1 }

end
