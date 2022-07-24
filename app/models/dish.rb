class Dish < ApplicationRecord
    has_one_attached :photo

    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true

    has_many :orders
end
