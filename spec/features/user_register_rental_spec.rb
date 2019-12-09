require 'rails_helper'

feature 'User register rental' do
    scenario 'successfully' do
        user = User.create!(email: 'test@test.com', password: '123456', role: :employee)

        login_as(user, scope: :user)
        Client.create!(name: 'Ana', document: '000.000.000-00', 
                       email: 'aaaaaaaa@aaaaaa.com')
        Client.create!(name: 'Kim', document: '111.111.111-11', 
                       email: 'bbbbbbbb@bbbbbb.com')
        CarCategory.create!(name: 'A', daily_rate: 100, 
                            car_insurance: 50, 
                            third_party_insurance: 90)
        CarCategory.create!(name: 'B', daily_rate: 200, 
                            car_insurance: 150, 
                            third_party_insurance: 190)
        visit root_path
        click_on 'Locação'
        click_on 'Agendar nova locação'

        fill_in 'Início', with: '2019-12-21'
        fill_in 'Fim', with: '2020-01-21'
        select 'Ana', from: 'Cliente'
        select 'A', from: 'Categoria'

        click_on 'Enviar'

        expect(page).to have_content('Locação agendada com sucesso')
        expect(page).to have_css('h1', text: 'Cliente: Ana')
        expect(page).to have_content('Início: 2019-12-21')
        expect(page).to have_content('Fim: 2020-01-21')
        expect(page).to have_content('Categoria: A')

    end
end
