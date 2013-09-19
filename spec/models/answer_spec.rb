require 'spec_helper'

describe Answer do
  context "validations" do
    it { should validate_presence_of :body }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :question_id }
    it { should validate_uniqueness_of :body }
  end

  context '#question' do
    it { should belong_to :question }
  end

  context '#user' do
    it { should belong_to :user }
  end

end
