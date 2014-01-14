require 'spec_helper'

describe '.average_rating' do
  
  let(:restaurant) {Restaurant.new(name: 'La Scala', description: 'Italian food')}

  context 'with no ratings' do
  
    it 'returns "Unrated"' do
      expect(restaurant.average_rating).to eq 'Unrated'
    end

  end

  context 'with one rating' do

    it 'returns the rating' do
      restaurant.reviews << Review.new(rating: 5)
      expect(restaurant.average_rating).to eq 5
    end
  
  end

  context 'with more than one rating' do

    it 'returns the average' do
      restaurant.reviews << Review.new(rating: 5)
      restaurant.reviews << Review.new(rating: 3)
      expect(restaurant.average_rating).to eq 4
    end
  
  end

end



