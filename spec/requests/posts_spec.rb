require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    it "displays posts" do
      create(:post, title: "Moo title")
      visit posts_path
      page.should have_content("Moo title")
    end
  end

  describe "POST /posts" do
    it "create post" do
      visit new_post_path
      fill_in "post_title",  :with => "Moo title"
      fill_in "post_link",   :with => "http:moo.com"
      fill_in "post_email",  :with => "moo@moo.com"
      click_button "Create Post"
      save_and_open_page
      page.should have_content("Post was successfully created.")
      page.should have_content("Moo title")
    end
  end
end
