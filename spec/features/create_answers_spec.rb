require 'spec_helper'

feature 'create answer', js: true do
  before(:each) do
    login
  end

  let(:user) { User.create(name: "hi", email: "hi@hi.com", password: "password")}
  let!(:question) { Question.create(
                            title: "Gouache to oil?",
                            body: "What is the gouache Vermillion equivallent in oil?",
                            user_id: user.id )}
  let(:answer) { Answer.create(
                            user_id: user.id,
                            question_id: question.id,
                            body: "Gouache...") }

  context "when user is logged in" do
    it "should have form available" do
      visit question_path(question)
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
