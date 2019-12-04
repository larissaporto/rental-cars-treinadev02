require 'rails_helper'

feature 'Admin edits subsidiary' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Amazonas', cnpj: '000.00.000/0000-00', address: 'Rua A')

    visit root_path
    click_on 'Filiais'
    click_on 'Amazonas'
    click_on 'Editar'
    fill_in 'Nome', with: 'Manaus'
    click_on 'Enviar'

    expect(page).to have_content('Manaus')
    expect(page).to have_content('Filial atualizada com sucesso')
  end

  scenario 'and must fill all fields' do
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