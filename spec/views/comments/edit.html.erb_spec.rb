require 'spec_helper'

describe "comments/edit.html.erb" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :post => nil,
      :text => "MyText",
      :email => "MyString"
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path(@comment), :method => "post" do
      assert_select "input#comment_post", :name => "comment[post]"
      assert_select "textarea#comment_text", :name => "comment[text]"
      assert_select "input#comment_email", :name => "comment[email]"
    end
  end
end
