require 'rails_helper'

def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

RSpec.feature "UserLogins", type: :feature, js:true do
  
  before :each do

    @user = User.create(
      first_name: "Test",
      last_name: "Name",
      email: "email@email.com",
      password: "12345"
    )
    
  end

  scenario "User logs in correctly" do
    # ACT
    visit root_path
    visit '/login'
    fill_in 'email', with: 'email@email.com'
    fill_in 'password', with: '12345'

    first('section.admin-products-index').click_button('Submit')
    
    # DEBUG / VERIFY
    save_screenshot 'photo.png'
    
    expect(page).to have_text 'Logout'
  end

end
