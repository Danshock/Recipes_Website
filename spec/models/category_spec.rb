require 'rails_helper'
RSpec.describe Category, type: :model do
  
  let(:category) { create(:category) }
  
  context "When category is correct and present" do
	  it "returns a valid category submission" do
	  	expect(category).to be_valid
	  end
  end

  context "When category name is not present" do
	  it "return not valid category submission" do
	  	not_valid_category = build(:category, name: nil)
	  	expect(not_valid_category).to_not be_valid
	  end
  end
end
