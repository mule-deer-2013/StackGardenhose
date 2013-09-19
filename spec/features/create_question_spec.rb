require 'spec_helper'

feature 'create answer' do
  let(:answer) { Answer.create(
                            user_id: 1,
                            question_id: 1,
                            body: "The solution to the problem is...") }

  context "when user is logged in" do
    it "should have form available" do
    end
  end

  context "if saved" do
    it "should show answer body" do
    end
  end

  context "if invalid" do
    it "should show error message" do
    end
  end
end
