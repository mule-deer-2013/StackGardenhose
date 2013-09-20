require 'spec_helper'


describe User do
  let(:user) { create(:user) }

  it "should have a name" do
    expect(user.name).not_to eq(nil)
  end



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

end
