require 'rails_helper'

feature 'Admin register car' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)

    login_as(user, scope: :user)
    Subsidiary.create!(name: 'Amazonas', cnpj: '000.00.000/0000-00', address: 'Rua A')
    manufacturer = Manufacturer.create!(name: 'Chevrolet')
    car_category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 50, 
                                       third_party_insurance: 90)
    CarModel.create!(name: 'Onix', year: '2020', motorization: '1.0', fuel_type: 'Flex',
                     manufacturer_id: manufacturer.id, car_category_id: car_category.id)

    visit root_path
    click_on 'Carros'
    click_on 'Registrar novo carro'

    fill_in 'Placa', with: 'ACS1234'
    fill_in 'Cor', with: 'Preto'
    fill_in 'Quilometragem', with: 30
    select 'Onix', from: 'Modelo de Carro'
    select 'Amazonas', from: 'Filial' 

    click_on 'Enviar'

    expect(page).to have_content('ACS1234')
    expect(page).to have_content('Carro criado com sucesso')
  end

  xscenario 'and must fill all fields' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)

    login_as(user, scope: :user)
    Subsidiary.create!(name: 'Amazonas', cnpj: '000.00.000/0000-00', address: 'Rua A')
    
    visit root_path   
    click_on 'Filiais'
    click_on 'Amazonas'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve resolver o seguinte:')  
  end

  xscenario 'and must be unique' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)

    login_as(user, scope: :user)
    Subsidiary.create!(name: 'Amazonas', cnpj: '000.00.000/0000-00', address: 'Rua A')
    Subsidiary.create!(name: 'Manaus', cnpj: '111.11.111/1111-11', address: 'Rua B')

    visit root_path   
    click_on 'Filiais'
    click_on 'Amazonas'
    click_on 'Editar'
    fill_in 'Nome', with: 'Manaus'
    click_on 'Enviar'

    expect(page).to have_content('Você deve resolver o seguinte:')  
  end
end