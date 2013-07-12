require 'spec_helper'

describe SoapHelpers do

  describe "SOAP Constants" do
    it "should return Apex company id" do
      helper.company_id.should eql "APEX01"
    end

    it 'should return CustomerService WSDL url' do
      helper.customer_service_wsdl.should eql "http://69.80.72.147/EpicorServices/CustomerService.asmx?WSDL"
    end
  end

  describe "SOAP Message bodies" do
    it "should return GetByID message body" do
      helper.get_by_id_message_body("1").should eql({"CompanyID" => "APEX01", "custNum" => "1"})
    end

    it "should return GetNewCustomer message body" do
      helper.new_customer_message.should eql({"CompanyID" => "APEX01"})
    end
  end

  describe "Savon Operations" do
     it "should return an instance of Savon::Client" do
         helper.soap_client("http://69.80.72.147/EpicorServices/CustomerService.asmx?WSDL").should be_an_instance_of Savon::Client
     end
  end

end