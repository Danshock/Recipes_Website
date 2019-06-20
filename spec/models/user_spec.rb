require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user1 = create(:user)
  end

  context "when valid attributes are submitted" do
    it "is valid with valid attributes" do
    	expect(@user1).to be_valid
    end
  end

  context "when invalid attributes are submitted" do
    it "is not valid when passwords do not match" do
      user2 = build(:user, password: "foo", password_confirmation: "bar")
      expect(user2).to_not be_valid
    end
  end

  context "when an attribute is not unique" do
    it "has not got a unique username or email" do
      user2 = build(:user)
      expect(user2).to_not be_valid
    end

    it "has a unique username" do
    	user2 = build(:user, email: "different_email@example.com")
    	expect(user2).to_not be_valid
    end

    it "has a unique email" do
    	user2 = build(:user, username: "different_username")
    	expect(user2).to_not be_valid
    end
  end

  context "when attributes are missing " do
    it "is not valid without a username" do
      user2 = build(:user, username: nil)
      expect(user2).to_not be_valid
    end

    it "is not valid without an email" do
      user2 = build(:user, email: nil)
      expect(user2).to_not be_valid
    end
  end
end
