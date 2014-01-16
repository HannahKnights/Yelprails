require 'spec_helper'

describe 'creating a review' do 
  
  before do
    user = create(:user)
    login_as user
    create(:review, user: user, restaurant: create(:restaurant))
  end

  context 'for a restaurant' do

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
      visit '/restaurants'
      expect(page).to have_content 'Average rating: 5'
    end

  end

  context 'with missing fields' do

    it 'should raise an error if it does not have a rating' do
      visit '/restaurants'
      click_link 'La Scala'
      click_link 'Add a review'
      fill_in 'Author Name', with: 'User'
      fill_in 'Review', with: 'Good food'
      click_button 'Create Review'
      expect(page).to have_content 'error'
    end

    it 'should raise an error if it does not have an author' do
      visit '/restaurants'
      click_link 'La Scala'
      click_link 'Add a review'
      fill_in 'Review', with: 'Good food'
      select('10', :from => 'Rating')
      click_button 'Create Review'
      expect(page).to have_content 'error'
    end

    it 'should raise an error if it does not have any content' do
      visit '/restaurants'
      click_link 'La Scala'
      click_link 'Add a review'
      fill_in 'Author Name', with: 'User'
      select('10', :from => 'Rating')
      click_button 'Create Review'
      expect(page).to have_content 'error'
    end

  end

end