class Barber < ActiveRecord::Base
    validates :name, presence: true
    validates :shop, presence: true
end