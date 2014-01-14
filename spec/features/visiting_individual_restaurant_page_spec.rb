require 'spec_helper'

describe 'visiting an individual restaurant index page' do
   
  context 'by clicking the restaurant name' do 
    
    it 'should display the name and description of the restaurant' do
      Restaurant.create(name: 'La Scala', description: 'Italian food')
      restaurant_id = Restaurant.first.id
      visit '/restaurants'
      click_link 'La Scala'
      expect(current_path).to eq '/restaurants/' + restaurant_id.to_s
      expect(page).to have_content 'La Scala'
      expect(page).to have_content 'Italian food'
    end

  end

end