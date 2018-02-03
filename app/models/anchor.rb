class Anchor < ApplicationRecord
  belongs_to :anchor_group, counter_cache: true

  validates_presence_of :latitude, :longitude
  validates :latitude, numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  def what_3_words_url
    "https://map.what3words.com/#{latitude},#{longitude}"
  end

  def google_map_url
    "https://www.google.com/maps/search/#{latitude},#{longitude}"
  end
end
