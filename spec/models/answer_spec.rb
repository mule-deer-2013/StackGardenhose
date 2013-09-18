require 'spec_helper'

describe Answer do
  context '#question' do
    it { should belong_to :question }
  end

  context '#user' do
    it { should belong_to :user }
  end

end
