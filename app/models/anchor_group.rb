class AnchorGroup < ApplicationRecord
  has_many :anchors

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
end
