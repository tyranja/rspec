require 'spec_helper'

describe MessagesController do
  describe "POST create" do
    let(:message) { mock_model(Message).as_null_object}

    before do
      Message.stub(:new).and_return(message)
    end

    it "creates a new message" do
      Message.should_receive(:new).with("text" => "a quick brown fox").and_return(message)
      post :create, message: { "text" => "a quick brown fox"}
    end

    it "saves the message" do
      post :create
    end

    context "when the message saves succcessfully" do
      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should eq("The message was saved successfully.")
      end

      it "redirects to the Messages index" do
       post :create
       response.should redirect_to(action: "index")
      end
    end

    context "when message fails to save" do
      it "assigns @message" do
        message.stub(:save).and_return(false)
        post :create
        assigns[:message].should eq(message)
      end

      it "renders the new template" do
        message.stub(:save).and_return(false)
        post :create
        response.should render_template("new")
      end
    end
  end
end