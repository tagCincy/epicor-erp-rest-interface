class Api::V1::CustomerServiceController < ApplicationController
  before_filter :customer_soap_client, except: [:get_customer_dataset]

  def get_customer_dataset
    Rails.logger.debug "1"
    @customers = params["customers"]
    @customer_data_set = build_customer_dataset
    message_body = ""

    @customer_data_set.each do |c|
      message_body += c
    end

    response = "<CustomerDataSet xmlns=\"\">
                    #{message_body}
                  </CustomerDataSet>"

    respond_to do |format|
      format.html
      format.json { render json: response }
      format.xml { render xml: response }
    end
  end

  def get_customer
    id = params[:id]
    soap_message = get_by_id_message_body id
    client = soap_client customer_service_wsdl

    output = client.call(:get_by_id) do
      attributes({'xmlns' => "http://epicor.com/webservices/"})
      message soap_message
    end

    response = output.body[:get_by_id_response][:get_by_id_result][:customer_data_set][:customer]

    respond_to do |format|
      format.html
      format.json { render json: response }
      format.xml { render xml: response }
    end
  end

  def get_updated_customers
    @company = params["company"]
    output = @client.call(:get_rows) do
      attributes({'xmlns' => "http://epicor.com/webservices/"})
      message("<CompanyID>#{@company}</CompanyID><whereClauseCustomer>NOT Character01 = '' AND CheckBox01 = true</whereClauseCustomer>")
    end

    customer_response = output.body[:get_rows_response][:get_rows_result].nil? ? [] :
        output.body[:get_rows_response][:get_rows_result][:customer_data_set][:customer]
    result = []
    customer_response.is_a?(Array) ? result = customer_response : result << customer_response
    response = []

    result.each do |r|
      response << {"Character01" => r[:character01], "CustId" => r[:cust_id], "CustNum" => r[:cust_num],
                   "Name" => r[:name], "Address1" => r[:address1],"Address2" => r[:address2], "Address3" => r[:address3], "City" => r[:city], "State" => r[:state],
                   "Zip" => r[:zip], "Country" => r[:country], "PhoneNum" => r[:phone_num], "FaxNum" => r[:fax_num]}
    end

    respond_to do |format|
      format.html
      format.json { render json: response }
      format.xml { render xml: response }
    end
  end

  def create_customer
    @company = params["company"]
    @customers = params["customers"]
    @customer_data_set = build_customer_dataset
    message_body = ""

    @customer_data_set.each do |c|
      message_body += c
    end

    output = @client.call(:update) do
      attributes({'xmlns' => "http://epicor.com/webservices/"})
      message(" <CompanyID>#{@company}</CompanyID>
                <CustomerData>
                  <CustomerDataSet xmlns=\"\">
                    #{message_body}
                  </CustomerDataSet>
	              </CustomerData>
                <continueProcessingOnError>false</continueProcessingOnError>"
      )
    end

    customer_response = output.body[:update_response][:update_result][:customer_data_set][:customer]
    result = []
    customer_response.is_a?(Array) ? result = customer_response : result << customer_response
    response = []

    result.each do |r|
      response << {"Character01" => r[:character01], "CustId" => r[:cust_id], "CustNum" => r[:cust_num],
                   "CustomerType" => r[:customer_type], "CheckBox01" => r[:check_box01]}
    end

    respond_to do |format|
      format.html
      format.json { render json: {"Accounts" => response} }
    end
  end

  private
  def build_customer_dataset
    data_set = customer_data_set.at_css "Customer"
    @customer_data_array = []

    @customers.each do |c|
      cust_data = data_set

      c.each do |k, v|
        cust_data.at_css("#{k}").content = v
      end

      @customer_data_array << cust_data.to_xml
    end

    @customer_data_array
  end

  def customer_soap_client
    @client ||= soap_client(customer_service_wsdl)
  end
end
