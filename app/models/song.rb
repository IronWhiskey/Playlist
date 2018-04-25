class Song < ActiveRecord::Base
    has_one :playlist
    has_many :users, through: :playlist
    validates :artist, :title, presence: true
    validates_uniqueness_of :title, :scope => :artist
end
