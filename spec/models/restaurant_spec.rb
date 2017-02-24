require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  describe '#average_rating' do
    context 'no reviews' do
      it 'returns "N/A" when there are no reviews' do
        restaurant = Restaurant.create(name: 'The Ivy')
        expect(restaurant.average_rating).to eq 'N/A'
      end
    end

    context "1 review" do
      it 'returns that rating' do
        user = User.create(email: "test@test.com", password: "123456")
        restaurant = Restaurant.create(name: 'The Ivy', user: user)
        restaurant.reviews.create(rating: 4, user: user)
        expect(restaurant.average_rating).to eq 4
      end
    end

    context "multiple reviews" do
      it 'returns the average' do
        user = User.create(email: "test@test.com", password: "123456")
        user2 = User.create(email: "t@test.com", password: "654321")
        restaurant = Restaurant.create(name: 'The Ivy', user: user)
        restaurant.reviews.create(rating: 1, user: user)
        restaurant.reviews.create(rating: 5, user: user2)
        expect(restaurant.average_rating).to eq 3
      end
    end

  end

  it 'is not valid with a name of less tan three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  describe 'Reviews' do
    let(:user) { User.create email: "test@test.com", password: "123456"}
    it 'is not valid unless it has a unique name' do
    Restaurant.create(name: "Moe's Tavern", user: user)
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
    end
  end

  describe "reviews" do
    describe 'build_with_user' do
      let(:user) { User.create email: 'test@test.com'}
      let(:restaurant) { Restaurant.create name: 'Test' }
      let(:review_params) { {rating: 5, thoughts: 'yum'} }

      subject(:review) { restaurant.reviews.build_with_user(review_params, user) }

      it 'builds a review' do
        expect(review). to be_a Review
      end

      it 'builds a review associated with the specified user' do
        expect(review.user).to eq user
      end

    end
  end

end
