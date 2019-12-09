require 'rails_helper'

feature 'Admin edits subsidiary' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)

    login_as(user, scope: :user)
    CarCategory.create!(name: 'A', daily_rate: 10, car_insurance: 10, third_party_insurance: 10)

    visit root_path
    click_on 'Categorias de Carro'
    click_on 'A'
    click_on 'Editar'
    fill_in 'Categoria', with: 'B'
    click_on 'Enviar'

    expect(page).to have_content('B')
    expect(page).to have_content('Categoria atualizada com sucesso')
  end

  scenario 'and must fill all fields' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)

    login_as(user, scope: :user)
    CarCategory.create!(name: 'A', daily_rate: 10, car_insurance: 10, third_party_insurance: 10)
    
    visit root_path   
    click_on 'Categorias de Carro'
    click_on 'A'
    click_on 'Editar'
    fill_in 'Categoria', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve resolver o seguinte:')  
  end

  scenario 'and must be unique' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)

    login_as(user, scope: :user)
    CarCategory.create!(name: 'A', daily_rate: 10, car_insurance: 10, third_party_insurance: 10)
    CarCategory.create!(name: 'B', daily_rate: 20, car_insurance: 20, third_party_insurance: 20)

    visit root_path   
    click_on 'Categorias de Carro'
    click_on 'A'
    click_on 'Editar'
    fill_in 'Categoria', with: 'B'
    click_on 'Enviar'

    expect(page).to have_content('Você deve resolver o seguinte:')  
  end
end