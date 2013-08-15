require 'spec_helper'

describe "CustomerServices" do

  describe "GET customer by id" do

    before :all do
      get api_v1_get_customer_path({id: 1, format: :json})
      @response = response
      @id = controller.params[:id]
    end

    it "should GET a valid response" do
      @response.status.should be(200)
    end

    it "should build proper response request with id" do
      response = JSON.parse(@response.body)
      expect(@id).to eq response["cust_num"]
    end

    it "should return the proper company id" do
      response = JSON.parse(@response.body)
      expect('APEX01').to eq response["company"]
    end
  end

  describe "POST create new customer" do

    before :all do
      post api_v1_create_customer_path, format: :json, "customers" => [{"CustID" => "ApexTest#{Random.rand(1..99)}", "Name" => "Apex Test #{Random.rand(1..99)}, LLC",
                                                                        "Address1" => "123 Main St", "City" => "Mason", "State" => "Ohio", "Zip" => "45040", "Country" => "United States",
                                                                        "TerritoryID" => "N.A.", "CustomerType" => "CUS"}]
      @response = response
    end

    it "should post JSON to create_customer action" do
      @response.status.should be(200)
    end

    it "should set customer hash to customer dataset" do
      ds = controller.send(:build_customer_dataset)
      Hash.from_xml(ds[0])['Customer']['Name'].should eq(controller.params["customers"][0]["Name"])
    end

    it "should return new customer JSON with valid custNum" do
      response = JSON.parse(@response.body)
      response["cust_num"].should_not eql("0")
    end
  end

  describe "GET updated customers" do

    before :all do
      hour = Time.now.hour
      get api_v1_get_updated_customers_path(format: :json, h: hour)
      @response = response
    end

    it "should return customers updated in the last hour" do
      @response.status.should be(200)
    end

    it "should return updated customer JSON" do
      response = JSON.parse(@response.body)
      test_customer = response.select { |x| x['cust_id'].eql?('TIMINTG123') }[0]
      expect(test_customer['cust_num']).to eq "115"
    end
  end
end
