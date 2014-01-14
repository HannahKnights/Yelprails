require 'spec_helper'

describe 'editing a review' do

  before do
    Restaurant.create(name: 'La Scala', description: 'Italian food')
    Restaurant.first.reviews.create(name: 'User', content: 'Good food', rating: 10)
  end

  it 'should update the review information' do

    visit '/restaurants'
    click_link 'Edit review'
    fill_in 'Review', with: 'Bad food'
    select('1', :from => 'Rating')
    click_button 'Update'
    expect(page).to have_content 'Bad food'
    expect(page).to have_content '1'
    expect(page).not_to have_content 'Good food'
  end

end