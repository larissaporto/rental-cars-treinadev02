class CarCategory < ApplicationRecord
    validates :name, :daily_rate, :car_insurance,
                :third_party_insurance, presence: {message: 'Deve 
                                                   preencher tudo'}
    validates :name, :daily_rate, :car_insurance, 
              :third_party_insurance, uniqueness: {message: 'Nome já 
                                                   em uso'} 
end
