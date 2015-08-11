require 'rails_helper'

feature 'User Logs in and creates reservation' do
  background do
    @user = create(:user)
  end
  scenario 'can log in from the index' do
    visit '/'
    click_link('User Login', match: :first)
    expect(page).to_not have_content('Create User')
    select 'Ex vitae quo est.', from: 'reservation[recipe]'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: '2'
    click_button 'send'
    expect(page).to have_content("you are logged in")
    fill_in 'Any Allergies?', with: "Ha look at me now."
    fill_in 'Date?', with: "08/05/2015"
    select '10:00am', from: 'reservation_time'
    fill_in 'reservation[address]', with: '5555 sw 555 st'
    fill_in 'reservation[address2]', with: '5555 sw 555 st'
    fill_in 'City', with: 'Miami'
    fill_in 'State', with: 'Florida'
    fill_in 'Zip', with: '33176'
    fill_in 'Phone', with: '555-555-5555'
    click_button 'Reserve'
    expect(page).to have_content("Created reservation")
    end
end
