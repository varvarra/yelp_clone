require 'rails_helper'

feature 'reviewing' do
  before {
    sign_up_and_in
    Restaurant.create(name: 'KFC', description: 'Deep fried goodness', id: 1)
  }


  scenario 'allows users to leave a review using a form when signed in' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
 end



   scenario 'allows users to leave a review using a form when not signed in' do
     click_link('Sign out')
     visit '/restaurants'
     expect(page).not_to have_content('Review KFC')
  end
end
