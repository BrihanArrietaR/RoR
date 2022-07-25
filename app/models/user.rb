class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: { minimum: 4}
    validates :address, presence: true
    validates_confirmation_of :password
    enum role: { administrator: 1, cook: 2, client: 3 }

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    has_many :orders
end
     