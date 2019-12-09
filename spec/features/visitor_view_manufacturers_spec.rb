require 'rails_helper'

feature 'Visitor view manufacturers' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :employee)

    login_as(user, scope: :user)
    Manufacturer.create(name: 'Fiat')
    Manufacturer.create(name: 'Volkswagen')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'

    expect(page).to have_content('Fiat')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :employee)

    login_as(user, scope: :user)
    Manufacturer.create(name: 'Fiat')
    Manufacturer.create(name: 'Volkswagen')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end