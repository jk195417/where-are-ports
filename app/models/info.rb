class Info < ApplicationRecord
  enum port_type: %i[
    commercial_port
    industrial_port
    fishing_port
    passenger_port
    entertainment_port
    naval_port
    typhoon_shelter
  ]
  enum fishable: %i[
    cannot_fishing
    can_fishing
    many_fishing
  ]
  enum hardwares: %i[
    lack_of_hardwares
    some_hardwares
    regular_hardwares
    have_many_hardwares
    rich_of_hardwares
  ]

  has_many :votes, dependent: :destroy

  belongs_to :user, counter_cache: true
  belongs_to :anchor_group, counter_cache: true

  validates_presence_of :name, :port_type, :fishable, :hardwares
end
