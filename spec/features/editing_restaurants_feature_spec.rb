require 'spec_helper'

describe 'editing restaurants' do

  before do
    create(:restaurant)
  end

  it 'should update restaurant information' do
    visit '/restaurants'
    click_link 'Edit restaurant'
    fill_in 'Name', with: 'New Name'
    click_button 'Update'
    expect(page).to have_content 'New Name'
    expect(page).not_to have_content 'La Scala'
  end

end