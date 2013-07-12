require 'spec_helper'

describe "CustomerContactServices" do

	describe "POST create new customer contact" do

		before :all do
			post api_v1_create_customer_contact_path, format: :json, "customer_contacts" => [{ "CustNum"      => "115", "Name" => "Tim Test#{Random.rand(1..99)}",
			                                                                                   "ContactTitle" => "Manager", "PhoneNum" => "5135551122" }]
			@response = response
		end

		it "should return valid response" do
			@response.status.should be(200)
		end

		it "should get a new cust cnt dataset" do
			ds = controller.send(:build_customer_contact_dataset)
			Hash.from_xml(ds[0])['CustCnt']['Name'].should eq(controller.params["customer_contacts"][0]["Name"])
		end

		it "should return new cust cnt JSON with a ContNum" do
			response = JSON.parse(@response.body)
			response["con_num"].should_not eq(nil)
		end

		it "should return new cust cnt JSON with valid ContNum" do
			response = JSON.parse(@response.body)
			response["con_num"].to_i.should_not be_zero
		end
	end
end

