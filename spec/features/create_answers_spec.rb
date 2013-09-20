require 'spec_helper'

feature 'create answer' do
  before(:each) do

  end

  let!(:question) { Question.create(
                            title: "Gouache to oil?",
                            body: "What is the gouache Vermillion equivallent in oil?",
                            user_id: 1) }
  let(:answer) { Answer.create(
                            user_id: 1,
                            question_id: question.id,
                            body: "Gouache...") }

  context "when user is logged in" do
    # it "should have form available" do     #For questions
    #   visit '/'
    #   page.should have_content("Ask a question")
    # end

    it "should have form avilable" do
      visit "/questions/#{question.id}"
      page.should have_content("Submit an answer")
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
