require 'rails_helper'
RSpec.describe Review, type: :model do
  
  let(:review) { create(:review) }

  context "valid review submission" do
  	it "returns a valid review submission when all attributes are correct" do
  		expect(review).to be_valid
  	end
  end

  context "invalid recipe submission" do
  	it "returns invalid submission when all attributes are missing" do
  		invalid_review = build(:review, comment: nil, rating: nil, user_id: nil)
  		expect(invalid_review).to_not be_valid
  	end

  	it "returns invalid submission when comment is missing" do
  		missing_comment_review = build(:review, comment: nil)
  		expect(missing_comment_review).to_not be_valid
  	end

    it "returns invalid submission when comment is too long" do
          long_comment = "E" * 321
          review = build(:review, comment: long_comment)
          expect(review).to_not be_valid
    end

  	it "returns invalid submission when rating is missing" do
  		missing_rating_review = build(:review, rating: nil)
  		expect(missing_rating_review).to_not be_valid
  	end
  end
end
