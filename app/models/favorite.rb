class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_drink
end