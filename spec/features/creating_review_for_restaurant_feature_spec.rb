require 'spec_helper'

describe 'reviewing' do 

  before do
    Restaurant.create(name: 'La Scala', description: 'Italian food')
  end

  context 'creating a review for a restaurant' do

    it 'should allow you to create a review' do
      visit '/restaurants'
      click_link 'La Scala'
      click_link 'Add a review'
      fill_in 'Author Name', with: 'User'
      fill_in 'Review', with: 'Good food'
      select('10', :from => 'Rating')
      click_button 'Create Review'
      expect(page).to have_content 'User'
      expect(page).to have_content 'Good food'
      expect(page).to have_content 'Good food'
    end

    it 'should display your average review rating' do
      Restaurant.first.reviews << Review.create(rating: 5)
      Restaurant.first.reviews << Review.create(rating: 3)
      visit '/restaurants'
      expect(page).to have_content 'Average rating: 4'
    end

  end

end