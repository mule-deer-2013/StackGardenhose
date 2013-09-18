require 'spec_helper'

describe Question do
  context '#user' do
    it { should belong_to :user }
  end

  context '#answers' do
    it { should have_many :answers }
  end

  context '#index' do
    it "should get index" do
      get :index
      assert_response :success
    end
  end
end
