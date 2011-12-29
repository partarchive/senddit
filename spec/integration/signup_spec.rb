require 'spec_helper'

# simple sign up macro for a user
def sign_up(user)
  within "#user_new" do
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: user.password_confirmation

    click_button 'Sign up'
  end
end

describe "the signup process", type: :request do

  context "with valid parameters" do
    before :each do
      @user = FactoryGirl.build(:user)
    end

    it "signs me up" do
      visit new_user_registration_path

      @user.password_confirmation = @user.password
      sign_up(@user)

      page.should have_content(@user.email)
      current_path.should eq(root_path)
    end
  end

  context "with invalid parameters" do
    before do
      visit new_user_registration_path
    end

    it "should require an email" do
      user = build(:user, email: nil)
      sign_up user
      page.should have_content("Email can't be blank")
    end

    it "should require a password" do
      user = build(:user, password: nil)
      sign_up user
      page.should have_content("Password can't be blank")
    end

    it "should confirm the password" do
      user = build(:user)
      sign_up user
      page.should have_content("Password doesn't match confirmation")
    end

    it "should not allow a user to sign up more than once" do
      first = create(:user)
      user = build(:user, email: first.email)
      sign_up user
      page.should have_content("Email has already been taken")
    end
  end

end
