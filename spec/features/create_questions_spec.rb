require 'spec_helper'

feature 'Questions controller' do
  let!(:user) { User.create(name: 'bob', password: 'bob') }

  describe "Questions#new route" do
    context "when user is logged in" do
      before(:each) do
        login(user)
        visit new_question_path
      end

      it "allows user to visit Question#new page" do
        expect(page.current_url).to eq("http://www.example.com/questions/new")
      end

      it "is visible on the page" do
        page.should have_css('#new_question')
      end

      it "allows user to create a question" do
        fill_in('question_title', with: "Awesome Title")
        fill_in('question_body', with: "Amazing Body")
        expect{click_on('Create Question')}.to change{Question.count}.by(1)
      end
    end

    context "when user is logged out" do
      before(:each) do
        visit new_question_path
      end
      it "should redirect user to signup form" do
        page.should have_content "Create an Account"
      end
    end
  end
end