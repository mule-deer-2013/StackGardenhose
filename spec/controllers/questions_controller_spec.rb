require 'spec_helper'

describe QuestionsController do
  let(:question) {create :question}

  describe "GET 'edit'" do
    it "renders the edit template" do
      get :edit, :id => question.id
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT 'update'" do
    let(:update_parameters) { { title: "changed the title", body: "still awesome body" }}
    let(:successful_params) { { :id => question.id, :question => update_parameters } }
    it "updates a question" do
      expect {
        put :update, successful_params
      }.to change {
       question.reload.title
      }.from("What is FactoryGirl?").to("changed the title")
    end
  end

end
