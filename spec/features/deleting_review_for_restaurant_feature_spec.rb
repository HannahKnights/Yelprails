require 'spec_helper'

describe 'deleting a review of a restaurant' do

  before do
    Restaurant.create(name: 'La Scala', description: 'Italian food')
    Restaurant.first.reviews.create(name: 'User', content: 'Good food', rating: 10)
  end

  it 'should no longer appear on the list of restaurants' do
    restaurant_id = Restaurant.first.id
    visit '/restaurants/' + restaurant_id.to_s
    expect(page).to have_content 'Good food'
    click_link 'Delete review'
    expect(page).not_to have_content 'Good food'

  end

end
