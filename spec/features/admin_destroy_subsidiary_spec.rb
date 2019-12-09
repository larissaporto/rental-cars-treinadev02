require 'rails_helper'

feature 'Admin destroy subsidiary' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)

    login_as(user, scope: :user)
    Subsidiary.create!(name: 'Amazonas', cnpj: '000.00.000/0000-00', address: 'Rua A')

    visit root_path
    click_on 'Filiais'
    click_on 'Amazonas'
    click_on 'Editar'
    click_on 'Apagar'

    expect(page).not_to have_content('Amazonas')
    expect(page).to have_content('Filial apagada')
  end
end