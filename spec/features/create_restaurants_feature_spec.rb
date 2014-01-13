require 'spec_helper'

  describe 'creating restaurants' do 

    context 'given a name and a decription' do

      it 'should display the new restaurants on the list of restaurants' do

        visit 'restaurants/new'
        fill_in 'Name', with: 'La Scala'
        fill_in 'Description', with: 'Italian food'
        click_button 'Create Restaurant'
        expect(current_path).to eq '/restaurants'
        expect(page).to have_content 'La Scala'

      end

    end

  end