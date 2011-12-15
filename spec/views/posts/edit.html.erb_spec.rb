require 'spec_helper'

describe "posts/edit.html.erb" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :title => "MyString",
      :link => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path(@post), :method => "post" do
      assert_select "input#post_title", :name => "post[title]"
      assert_select "input#post_link", :name => "post[link]"
      assert_select "input#post_email", :name => "post[email]"
    end
  end
end
