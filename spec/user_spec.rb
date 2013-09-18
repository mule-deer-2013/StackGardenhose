require 'spec_helper'

describe User do
  context '#questions' do
    it { should have_many :questions }
  end

  context '#answers' do
    it { should have_many :answers }
  end

end
