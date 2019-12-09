class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :subsidiary

  # TODO validações
end
