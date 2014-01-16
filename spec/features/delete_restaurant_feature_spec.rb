require 'spec_helper'

describe 'deleting a restaurant' do 

  it 'should no longer appear on the lists of restaurants' do
    restaurant = create(:restaurant)
    visit '/restaurants'
    expect(page).to have_content restaurant.name
    click_link 'Delete restaurant'
    expect(page).not_to have_content restaurant.name
  end

end