require 'rails_helper'

feature 'User register client' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :employee)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on 'Registrar novo Cliente'

    fill_in 'Nome', with: 'Aline'
    fill_in 'CPF', with: '000.000.000-00'   
    fill_in 'Email', with: '0000@gmail.com'   
    click_on 'Enviar'

    expect(page).to have_content('Aline')
    expect(page).to have_content('000.000.000-00')
    expect(page).to have_content('0000@gmail.com')
    expect(page).to have_content('Cliente criado com sucesso')
  end
end