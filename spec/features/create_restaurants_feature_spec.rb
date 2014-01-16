require 'spec_helper'

  describe 'creating restaurants' do 

    before do
      login_as create(:user)
      create(:restaurant)
    end

    context 'given a name and a decription' do

      it 'should display the new restaurants on the list of restaurants' do

        visit 'restaurants'
        expect(page).to have_content 'La Scala'

      end

    end

    context 'with a missing name or description field' do

      it 'should raise an error if it does not have a description' do

        visit 'restaurants/new'
        fill_in 'Name', with: 'La Scala'
        click_button 'Create Restaurant'
        expect(page).to have_content 'error'

      end

      it 'should raise an error if it does not have a name' do

        visit 'restaurants/new'
        fill_in 'Description', with: 'Italian food'
        click_button 'Create Restaurant'
        expect(page).to have_content 'error'

      end

    end

  end