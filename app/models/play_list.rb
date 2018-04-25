class PlayList < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  validates :count, presence: true
end
