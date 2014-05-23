require 'spec_helper'

describe Idea do
  it 'should have valid factories' do
    FactoryGirl.create(:idea).should be_valid
  end

  describe 'validations' do
    describe 'description' do
      it 'should be present' do
        FactoryGirl.build(:idea, description: nil).should_not be_valid
      end

      it 'should be less than 255 characters' do
        FactoryGirl.build(:idea, description: "a" * 256).should_not be_valid
      end
    end

    describe 'user_id' do
      it 'should be present' do
        FactoryGirl.build(:idea, user_id: nil).should_not be_valid
      end
    end
  end

  it 'should be voteable by other users' do
    user = FactoryGirl.create(:user)
    idea = FactoryGirl.create(:idea)

    expect { user.up_vote(idea) }.to change(idea, :plusminus).by(1)
  end

  it 'should not be voteable by its creator' do
    idea = FactoryGirl.create(:idea)

    expect { idea.user.up_vote(post) }.to change(idea, :plusminus).by(0)
  end
end
