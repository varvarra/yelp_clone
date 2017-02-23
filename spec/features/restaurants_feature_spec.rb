require 'rails_helper'

feature 'restaurants' do

  # context 'no restaurants have been added' do
  #   scenario 'should display a prompt to add a restaurant' do
  #     visit restaurant_path
  #     expect(page).to have_content 'No restaurants yet'
  #     expect(page).to have_link 'Add a restaurant'
  #   end
  # end


  # let!(:user){User.where(email: "test@example.com").first}


  context 'restaurants have been added' do

    before do
      sign_up_and_in
      @user.restaurants.create(name: 'KFC')
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants yet')
    end

    scenario "can see a list of restaurants when signed out" do
      click_link('Sign out')
      visit '/restaurants'
      expect(page).to have_content "KFC"
    end
  end

  context 'creating restaurants' do

    before do
      sign_up_and_in

    end
    scenario 'prompt user to fill out a form, then displays the new restaurant' do
      visit restaurants_path     # rails route helper
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq '/restaurants'
    end


    context 'an invalid restaurant' do
      scenario 'does not let you submit a name that is too short' do
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'kf'
        click_button 'Create Restaurant'
        expect(page).not_to have_css 'h2', text: 'kf'
        expect(page).to have_content 'error'
      end
    end
  end

  context "viewing restaurants" do
    let!(:kfc){ Restaurant.create(name:"KFC") }
    before {sign_up_and_in
      @user.restaurants.create(name: 'KFC')
    }
    scenario "lets the user view a restaurant" do

      visit restaurants_path
      click_link "KFC"
      expect(page).to have_content "KFC"
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end


    scenario "can view a restaurant when signed out" do
      click_link('Sign out')
      visit '/restaurants'
      click_link "KFC"
      expect(page).to have_content "KFC"
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end

  context 'editing restaurants' do
    # before { Restaurant.create name: 'KFC', description: 'Deep fried goodness', id: 1 }
    scenario 'let a user edit a restaurant' do
      sign_up_and_in
      @restaurant = @user.restaurants.create(name: 'KFC', description: 'deep fried goodness')
      visit restaurants_path
      click_link 'Edit KFC'
      fill_in 'Name', with: 'Kentucky Fried Chicken'
      fill_in 'Description', with: 'Deep fried goodness'
      click_button 'Update Restaurant'
      click_link 'Kentucky Fried Chicken'
      expect(page).to have_content 'Kentucky Fried Chicken'
      expect(page).to have_content 'Deep fried goodness'
      expect(current_path).to eq "/restaurants/#{@restaurant.id}"
    end
  end

  context 'deleting restaurants' do
    scenario 'removes a restaurant when a user clicks a delete link' do

      sign_up_and_in
      @user.restaurants.create(name: 'KFC', description: 'deep fried goodness')
      visit restaurants_path
      click_link 'Delete KFC'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end
end
