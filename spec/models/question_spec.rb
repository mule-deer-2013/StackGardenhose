require 'spec_helper'

describe Question do
  let(:user) { User.create(name: 'dan', email: 'dan@dan.com', password: 'dan') }
  let(:invalid_question) { Question.new() }
  let(:valid_question) { Question.new(title: "Title2", body: "Awesome content", user_id: user.id) }

  context "creation" do
    context "with invalid information" do
      it "should raise an error when user is absent" do
        invalid_question.title = "Title"
        invalid_question.body = "Blah blah blah"
        expect{ invalid_question.save! }.to raise_error
      end

      it "should raise an error when title is absent" do
        invalid_question.user_id = user.id
        invalid_question.body = "Blah blah blah"
        expect{ invalid_question.save! }.to raise_error 
      end

      it "should raise an error when body is absent" do
        invalid_question.user_id = user.id
        invalid_question.title = "Title"
        expect{ invalid_question.save! }.to raise_error 
      end
    end

    context "with valid information" do
      it "should not raise any errors" do
        expect{valid_question.save!}.not_to raise_error
      end

      it "should successfully create a new question" do
        expect{valid_question.save!}.to change{Question.count}.by(1)
      end
    end
  end

  context 'that exists' do
    before(:each) do
      valid_question.save
    end

    it "should be able to have many answers" do
      10.times { valid_question.answers.create(user_id: user.id, body: "Answer text") }
      expect(valid_question.answers.count).to eq(10)
    end

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
