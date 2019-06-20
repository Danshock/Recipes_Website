require 'rails_helper'
RSpec.describe Devise::Mailer do
    
    before(:each) do
  	   @unconfirmed_user = create(:user)
    end

    before(:each) do
    	@confirmation_email = Devise.mailer.deliveries.last
    end

	context "when a user registers successfully" do 
	  
	  it "sends a confirmation email" do
	  	# user = FactoryBot.create(:user, confirmed_at: nil)
	  	# confirmation_email = Devise.mailer.deliveries.last
	  	expect(@unconfirmed_user.email).to eq @confirmation_email.to[0]
	  	expect(@confirmation_email.body.encoded).to include "You can confirm your account email"
	  end

	  it "sends a confirmation email with correct Subject title" do
	  	expect(@confirmation_email.subject).to eq "Confirmation instructions"
	  end
	end

	
end