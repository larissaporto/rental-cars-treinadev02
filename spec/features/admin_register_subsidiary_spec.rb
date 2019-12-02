require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'successfully' do
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
end