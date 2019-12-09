class Client < ApplicationRecord
    validates :name, :document, :email, presence: {message: 'Deve 
                                                   preencher tudo'}
    validates :name, :document, :email, uniqueness: {message: 'Nome já
                                                     já em uso'}                                               
    
    def description
        "#{name} - #{document}"
    end
end
