require 'spec_helper'
require_relative 'helpers/sessions'

include SessionHelpers

describe 'creatign a review' do 

  let!(:restaurant) {create(:restaurant)}
  
  context 'as a user who is' do

    it 'logged in' do
      login_as create(:user)
      add_review( restaurant.name, 'Good food', '10')
      expect(page).not_to have_content 'error'
      expect(page).to have_content 'Good food'
    end

    it 'logged out' do
      visit '/restaurants'
      click_link restaurant.name
      click_link 'Add a review'
      expect(page).to have_content 'Login'
      expect(page).not_to have_field 'Review'
    end

  end

  context 'with missing fields' do

    before do
      login_as create(:user)
    end
  

    it 'should raise an error if it does not have a rating' do
      visit '/restaurants'
      click_link 'La Scala'
      click_link 'Add a review'
      fill_in 'Review', with: 'Good food'
      click_button 'Create Review'
      expect(page).to have_content 'error'
    end

    it 'should raise an error if it does not have any content' do
      add_review( restaurant.name, '', '10')
      expect(page).to have_content 'error'
    end

  end

  context 'that is successful' do

    before do
      user = create(:user)
      login_as user
      create(:review, user: user, restaurant: create(:restaurant))
    end

    it 'should display your average review rating' do
      visit '/restaurants'
      expect(page).to have_content 'Average rating: 5'
    end

  end

end