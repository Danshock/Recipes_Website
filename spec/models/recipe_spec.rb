require 'rails_helper'

RSpec.describe Recipe, type: :model do
  
  context "valid recipe submissions"
    it "returns a valid recipe submission" do
        recipe = Recipe.new(title: "Example Title", description: "Example Description", author: "Example Author")
        expect(recipe).to be_valid
    end

  context "invalid recipe submissions"
    it "returns an invalid recipe submission because of missing attributes" do
    	recipe = Recipe.new()
    	expect(recipe).to_not be_valid
    end

    it "returns an invalid recipe submission because author is missing" do
    	recipe = Recipe.new(title: "Example Title", description: "Example Description")
    	expect(recipe).to_not be_valid
    end

    it "returns an invalid recipe submission because title is too short" do
    	recipe = Recipe.new(title: "E", description: "Example Description", author: "Example Author")
    	expect(recipe).to_not be_valid
    end

    it "returns an invalid recipe submission because title is too long" do
    	long_title = "E" * 81
    	recipe = Recipe.new(title: long_title, description: "Example Description", author: "Example Author")
    	expect(recipe).to_not be_valid
    end      
end
