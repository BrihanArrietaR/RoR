class User < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    enum role: { administrator: 1, cook: 2, client: 3 }

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    has_many :orders
end
     