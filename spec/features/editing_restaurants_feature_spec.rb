require 'spec_helper'

describe 'editing restaurants' do

  before do
  Restaurant.create(name: 'Old Name')
  end

  it 'should update restaurant information' do
  
    visit '/restaurants'
    click_link 'Edit restaurant'
    fill_in 'Name', with: 'New Name'
    click_button 'Update'
    expect(page).to have_content 'New Name'
    expect(page).not_to have_content 'Old Name'

  end

end