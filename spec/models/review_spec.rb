require 'spec_helper'

describe '.average_rating' do
  
  let(:user) { create(:user) }
  let(:restaurant) { create(:restaurant) }

  context 'with no ratings' do
  
    it 'returns "Unrated"' do
      expect(restaurant.average_rating).to eq 'Unrated'
    end

  end

  context 'with one rating' do

    it 'returns the rating' do
      restaurant.reviews << build(:review, user: user)
      expect(restaurant.average_rating).to eq 5
    end
  
  end

  context 'with more than one rating' do

    it 'returns the average' do
      restaurant.reviews << build(:review, rating: 5, user: user)
      restaurant.reviews << build(:review, rating: 3, user: user)
      expect(restaurant.average_rating).to eq 4
    end
  
  end

end



