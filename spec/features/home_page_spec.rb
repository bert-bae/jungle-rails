require 'rails_helper'

def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  before :each do

    @category = Category.create! name:"Test Category"

    10.times do |item|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99,
        image: open_asset('apparel1.jpg')
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot 'photo.png'
    
    expect(page).to have_css 'article.product', count: 10
  end

end