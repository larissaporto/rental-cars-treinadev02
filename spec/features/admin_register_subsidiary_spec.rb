require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova Filial'

    fill_in 'Nome', with: 'Manaus'
    fill_in 'CNPJ', with: '00.000.000/0000-00'   
    fill_in 'Endereço', with: 'Rua C'   
    click_on 'Enviar'

    expect(page).to have_content('Manaus')
    expect(page).to have_content('00.000.000/0000-00')
    expect(page).to have_content('Rua C')
  end

  scenario 'and must fill all fields' do
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

  scenario 'and must be unique' do
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