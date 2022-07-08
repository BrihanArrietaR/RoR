class Order < ApplicationRecord
    validates :date, presence: true
    enum state: { ontime: 0, overtime: 1, delayed: 2, canceled: 3, delivered: 4}
    
    belongs_to :user
end
