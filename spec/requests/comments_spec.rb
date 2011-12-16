require 'spec_helper'

describe "Comments" do
  describe "GET /comments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      post = create(:post)
      comment = build(:comment)
      post post_comments_path(post), comment: comment.attributes

      response.should redirect_to(post)
    end
  end
end
