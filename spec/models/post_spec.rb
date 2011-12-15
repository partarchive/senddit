require 'spec_helper'

describe Post do
  it "should accept valid attributes" do
    post = build(:post)
    post.should be_valid
  end
  
  it "should not accept invalid link" do
    post = build(:post, link: "not_a_link_http://google.com_more_gibberish")
    post.should_not be_valid
  end
  
  it "should not accept invalid email" do
    post = build(:post, email: "email")
    post.should_not be_valid
  end
end
