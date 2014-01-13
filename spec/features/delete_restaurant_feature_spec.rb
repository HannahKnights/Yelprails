require 'spec_helper'

describe 'deleting a restaurant' do 

  before do
  Restaurant.create(name: 'La Scala', description: 'Italian food')
  end

  it 'should no longer appear on the lists of restaurants' do

    visit '/restaurants'
    expect(page).to have_content 'La Scala'
    click_link 'Delete restaurant'
    expect(page).not_to have_content 'La Scala'

  end

end