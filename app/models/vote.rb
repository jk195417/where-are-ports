class Vote < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :info, counter_cache: true
end
