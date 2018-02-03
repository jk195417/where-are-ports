class AnchorGroup < ApplicationRecord
  has_many :anchors
  has_many :infos
  
  validates_presence_of :latitude, :longitude
  validates :latitude, numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  def closest_anchor
    ary = []
    anchors.each { |a| ary << distance_square_to(a.latitude, a.longitude) }
    anchors[ary.index(ary.max)]
  end

  def distance_square_to(lat, lng)
    (latitude - lat).abs**2 + (longitude - lng).abs**2
  end

  def what_3_words_url
    "https://map.what3words.com/#{what_3_words}"
  end

  def google_map_url
    "https://www.google.com/maps/search/#{latitude},#{longitude}"
  end
end
