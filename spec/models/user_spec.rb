require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:all) do
  	@user1 = create(:user)
  end

  it "is valid with valid attributes" do
  	expect(@user1).to be_valid
  end

  it "has a unique username" do
  	user2 = build(:user, email: "random_email@example.com")
  	expect(user2).to_not be_valid
  end

end
