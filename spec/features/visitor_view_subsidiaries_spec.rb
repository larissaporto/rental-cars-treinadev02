require 'rails_helper'

feature 'Visitor view subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create(name: 'Salvador', cnpj: '123456', 
                      address: 'Rua A')
    

    visit root_path
    click_on 'Filiais'
    click_on 'Salvador'
    
    expect(page).to have_content('Salvador')
    expect(page).to have_content('123456')
    expect(page).to have_content('Rua A')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    Subsidiary.create(name: 'Salvador', cnpj: '123456', 
                      address: 'Rua A') 

    visit root_path
    click_on 'Filiais'
    click_on 'Salvador'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end
