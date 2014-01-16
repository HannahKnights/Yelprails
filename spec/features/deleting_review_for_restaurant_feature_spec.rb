require 'spec_helper'

describe 'deleting a review of a restaurant' do

  let(:restaurant) { create(:restaurant) }

  before do
    create(:review, user: create(:user), restaurant: restaurant)
  end

  it 'should no longer appear on the list of restaurants' do

    visit '/restaurants/' + restaurant.id.to_s
    expect(page).to have_content 'Average food'
    click_link 'Delete review'
    expect(page).not_to have_content 'Average food'
  end

end
