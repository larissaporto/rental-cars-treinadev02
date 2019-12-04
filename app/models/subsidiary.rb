class Subsidiary < ApplicationRecord
    validates :name, :cnpj, :address, presence: {message: 'Deve 
                                                   preencher tudo'}
    validates :name, :cnpj, :address, uniqueness: {message: 'Nome já
                                                     já em uso'} 
end
