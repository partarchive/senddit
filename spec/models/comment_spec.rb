require 'spec_helper'

describe Comment do

  it "should create with valid parameters" do
    comment = build(:comment)
    comment.should be_valid
  end
  
  describe "should not create with" do
    it "empty email" do
      comment = build(:comment, {email: nil})
      comment.should_not be_valid
    end
    
    it "invalid email" do
      comment = build(:comment, {email: "invalidemail"})
      comment.should_not be_valid
    end
    
    it "empty text" do
      comment = build(:comment, {text: ""})
      comment.should_not be_valid
    end
    
    it "no post object" do
      comment = build(:comment, {post: nil})
      comment.should_not be_valid
    end
  end
end
