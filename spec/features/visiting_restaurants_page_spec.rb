require 'spec_helper'

describe 'visiting restaurants index page' do
    
  context 'having created a Restaurant' do

    it 'should have the name and description of the restaurant' do
      restaurant = create(:restaurant)
      visit '/restaurants'
      expect(page).to have_content restaurant.name
      expect(page).to have_content restaurant.description
    end

  end

  context 'without a Restaurant' do

    it 'should display a helpful message' do
    visit '/restaurants'
    expect(page).to have_content 'No restaurants have been listed yet!'
    end

  end

end