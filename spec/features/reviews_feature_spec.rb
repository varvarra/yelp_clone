require 'rails_helper'

feature 'reviewing' do
  before {
    sign_up_and_in
    @restaurant = Restaurant.create(name: 'KFC', description: 'Deep fried goodness', user: @user)
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

   scenario 'does not allow users to leave a review using a form when not signed in' do
     click_link('Sign out')
     visit '/restaurants'
     expect(page).not_to have_content('Review KFC')
  end

  scenario 'displays an average rating for all reviews' do
    leave_review('So so', '3')
    sign_in_with_another_user
    leave_review('Great', '5')
    expect(page).to have_content('Average rating: ★★★★☆')
  end
end
