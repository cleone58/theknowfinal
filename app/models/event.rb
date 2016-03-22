class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  has_many :bookmarks
  has_many :watchers, through: :bookmarks, source: :user
end
