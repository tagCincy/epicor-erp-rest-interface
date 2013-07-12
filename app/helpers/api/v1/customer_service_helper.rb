module Api::V1::CustomerServiceHelper

  def get_by_id_body id
    @result = {"CompanyID" => get_company_id, "custNum" => id}
  end

  def get_wsdl
    "http://69.80.72.147/EpicorServices/CustomerService.asmx?WSDL"
  end

  def get_company_id
    "APEX01"
  end

  def get_soap_client
    wsdl_url = get_wsdl
    @client = Savon.client do
      wsdl wsdl_url
      wsse_auth("manager", "manager")
      pretty_print_xml true
      log_level :error
      convert_request_keys_to :camelcase
      env_namespace :soap
      namespace_identifier nil
    end
  end
end
