class Api::V1::CustomerContactServiceController < ApplicationController
  before_filter :customer_contact_soap_client

  def create_customer_contact
    @contacts = params["customer_contacts"]
    @contact_data_set = build_customer_contact_dataset
    message_body = ""

    @contact_data_set.each do |c|
      message_body += c
    end

    output = @client.call(:update) do
      attributes({'xmlns' => "http://epicor.com/webservices/"})
      message(" <CompanyID>APEX01</CompanyID>
                <CustCntData>
                  <CustCntDataSet xmlns=\"\">
                    #{message_body}
                  </CustCntDataSet>
	              </CustCntData>
                <continueProcessingOnError>false</continueProcessingOnError>"
      )
    end

    response = output.body[:update_response][:update_result][:cust_cnt_data_set][:cust_cnt]

    respond_to do |format|
      format.html
      format.json { render json: response }
    end
  end

  private
  def build_customer_contact_dataset
    data_set = customer_contact_data_set.at_css "CustCnt"
    @contact_data_array = []

    @contacts.each do |c|
      cnt_data = data_set

      c.each do |k, v|
        cnt_data.at_css("#{k}").content = v
      end

      @contact_data_array << cnt_data.to_xml
    end

    @contact_data_array
  end

  def customer_contact_soap_client
    @client ||= soap_client(customer_contact_service_wsdl)
  end
end
