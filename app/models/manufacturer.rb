class Manufacturer < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: {message: 'Nome já está em uso'}
end
