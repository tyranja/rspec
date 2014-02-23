require 'spec_helper'

describe "messages/new.html.erb" do
  it "renders a form to create a message" do
    assign(:message, double("Message"))
    render
    rendered.should have_selector("form",
      method: "post",
      action: messages_path
     ) do |form|
       form.should have_selector("input", type: "submit")
     end
  end
end
