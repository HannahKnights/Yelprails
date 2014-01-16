require 'spec_helper'
require_relative 'helpers/sessions'

include SessionHelpers

  describe 'creating a restaurant' do 

    before do
      login_as create(:user)
    end

    context 'with all fields filled in' do

      it 'should display the new restaurants on the list of restaurants' do
        add_restaurant('La Scala', 'Italian food')
        expect(page).to have_content 'La Scala'
      end

    end

    context 'with a missing fields' do

      it 'should raise an error if it does not have a description' do
        add_restaurant('La Scala', '')
        expect(page).to have_content 'error'

      end

      it 'should raise an error if it does not have a name' do
        add_restaurant('', 'Italian food')
        expect(page).to have_content 'error'
      end

    end

  end