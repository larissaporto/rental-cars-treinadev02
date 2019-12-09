require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Categorias de Carro'
    click_on 'Registrar nova Categoria'

    fill_in 'Categoria', with: 'A'
    fill_in 'Diária', with: 20   
    fill_in 'Seguro', with: 30000   
    fill_in 'Seguro de Terceiros', with: 50000    
    click_on 'Enviar'

    expect(page).to have_content('A')
    expect(page).to have_content(20)
    expect(page).to have_content(30000)
    expect(page).to have_content(50000)
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