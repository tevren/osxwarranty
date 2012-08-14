require 'spec_helper'

describe OSXwarranty do
	before :each do 
		@warranty = OSXwarranty::Base.new
		@serial = "G86250YSU39"
		@model = "Mac Pro"
	end

	describe "#get_warranty_info" do
		it "should return the size of the hash returned from #get_warranty_info" do
		  @warranty.get_warranty_info(@serial).size.should eql 2
		end
	end
	describe "#get_model_info" do
		it "should not be nil" do
		  @warranty.get_model_info(@serial).size.should_not be_nil
		end
	end
	describe "#asdcheck" do
		it "should not be nil" do
		  @warranty.asdcheck(@model).size.should_not be_nil 
		end
	end

	describe "#info" do 
		it "should return the size of the hash returned from #info" do 
			@warranty.info(@serial).size.should eql 4
		end
	end
end