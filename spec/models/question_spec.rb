require 'spec_helper'

describe Question do

  let(:user) { create(:user) }
  let(:question) { create :question, :user => user }
  let(:invalid_question) { Question.new }
  let(:valid_question)  { build(:question) }

  context "creation" do
    context "with invalid information" do
      it "should raise an error when user is absent" do
        invalid_question.title = "Title"
        invalid_question.body = "Blah blah blah"
        invalid_question.save
        expect(invalid_question.errors).to include("user can't be blank")
        expect{ invalid_question.save! }.to raise_error # this is a bad test
      end

      # this could be relpaced with: it { should validate_presence_of :title }
      it "should raise an error when title is absent" do
        invalid_question.user = user
        invalid_question.body = "Blah blah blah"
        expect{ invalid_question.save! }.to raise_error
      end

      it "should raise an error when body is absent" do
        invalid_question.user = user
        invalid_question.title = "Title"
        expect{ invalid_question.save! }.to raise_error
      end
    end

    context "with valid information" do
      it "should not raise any errors" do
        expect{valid_question.save!}.not_to raise_error
      end

      it "should successfully create a new question" do
        expect {
          valid_question.save
        }.to change(Question, :count).by(1)
      end
    end
  end

  context 'that exists' do
    before(:each) do
      valid_question.save
    end

    # it "should be able to have many answers" do
    #   10.times { valid_question.answers.create(user_id: user.id, body: "Answer text") }
    #   expect(valid_question.answers.count).to eq(10)
    # end

    # bad test, test for format
    it "should have a title and a body" do
      expect(valid_question.title).to be_an_instance_of(String)
      expect(valid_question.body).to be_an_instance_of(String)
    end

    it "should be able to be edited" do
      valid_question.title = "New title!"
      valid_question.save
      expect(valid_question.title).to eq("New title!")
    end
  end

end
