require 'spec_helper'

describe "posts/index.html.erb" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :title => "Title",
        :link => "Link",
        :email => "Email"
      ),
      stub_model(Post,
        :title => "Title",
        :link => "Link",
        :email => "Email"
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select ".post > .title", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select ".post > a.title", :href => "Link".to_s, :count => 2
  end
end
