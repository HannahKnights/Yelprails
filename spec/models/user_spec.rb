require 'spec_helper'

  describe '.reviewd?' do

    let(:user) { create(:user)}
    let(:unreviewed) { create(:restaurant) }
    let(:reviewed) { create(:review, user: user, restaurant: create(:restaurant))}
      
    it 'should return false for restaurant I have not reviewed' do
      expect(user.reviewed?(unreviewed)).to be_false
    end

    it 'should return true for restaurant I have reviewed' do
      expect(user.reviewed?(reviewed)).to be_true
    end

  end 

