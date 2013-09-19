require 'spec_helper'

describe User do
  context '#questions' do
    it { should have_many :questions }
  end

  context '#answers' do
    it { should have_many :answers }
  end

  context 'creating a user' do
    subject { User.new(name: "Richie", email: "richie@gmail.com", password: "123" ) }
    it { should be_instance_of User }
      its (:name) { should == "Richie" }
      its (:email) { should == "richie@gmail.com" }
      its (:password) { should == "123" }
  end

  context 'creating an invalid new user' do
    subject { User.new()}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
    end

    it "with already taken name should raise error" do
    end

end
