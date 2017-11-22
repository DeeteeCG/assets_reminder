require 'rails_helper'

RSpec.feature "SignIns", type: :feature do
  describe "sign in" do
    before(:each) do
      User.create(first_name: 'bbb', last_name: 'bbb', email: 'bbb@gmail.com', password: '1234567', password_confirmation: '1234567')
    end

    it "sign me in and show message" do
      visit '/login'
      within('form[action="/sessions"]') do
        find('#email').set('bbb@gmail.com')
        find('#password').set('1234567')
      end
      click_button 'Log In'
      expect(page).to have_content('Logged in!')
      # expect(page).to have_content 'Success'
    end
  end
end
