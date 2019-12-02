require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'successfully' do
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
end