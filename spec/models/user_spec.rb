require 'spec_helper'

describe User do

  it "should require an email address" do
    user = build(:user, email: nil)
    user.should_not be_valid
  end

  it "should only allow a valid email" do
    user = build(:user, email: "bad/email")
    user.should_not be_valid
  end

  it "should require a password" do
    user = build(:user, password: nil)
    user.should_not be_valid
  end

end
