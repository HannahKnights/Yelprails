require 'spec_helper'

describe 'visiting an individual restaurant index page' do
   
  context 'by clicking the restaurant name' do 
    
    it 'should display the name and description of the restaurant' do
      restaurant = create(:restaurant)
      visit '/restaurants'
      click_link 'La Scala'
      expect(current_path).to eq '/restaurants/' + restaurant.id.to_s
      expect(page).to have_content 'La Scala'
      expect(page).to have_content 'Italian food'
    end

  end

end