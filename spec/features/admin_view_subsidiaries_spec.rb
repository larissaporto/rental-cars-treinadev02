require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)

    login_as(user, scope: :user)
    Subsidiary.create!(name: 'Salvador', cnpj: '00.000.000/0000-00', 
                      address: 'Rua A')
    

    visit root_path
    click_on 'Filiais'
    click_on 'Salvador'
    
    expect(page).to have_content('Salvador')
    expect(page).to have_content('00.000.000/0000-00')
    expect(page).to have_content('Rua A')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)

    login_as(user, scope: :user)
    Subsidiary.create(name: 'Salvador', cnpj: '123456', 
                      address: 'Rua A') 

    visit root_path
    click_on 'Filiais'
    click_on 'Salvador'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end
