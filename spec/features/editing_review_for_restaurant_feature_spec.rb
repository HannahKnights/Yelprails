require 'spec_helper'

describe 'editing a review' do

  let(:restaurant) { create(:restaurant) }

   before do
    user = create(:user)
    login_as user
    create(:review, user: user, restaurant: restaurant)
  end

  it 'should update the review information' do
    visit '/restaurants/' + restaurant.id.to_s
    click_link 'Edit review'
    fill_in 'Review', with: 'Bad food'
    select('1', :from => 'Rating')
    click_button 'Update'
    expect(page).to have_content 'Bad food'
    expect(page).to have_content '1'
    expect(page).not_to have_content 'Average food'
  end

end