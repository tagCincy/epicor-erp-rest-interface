EpicorSoapConnector::Application.routes.draw do

	root to: "main#index"

	match "/", to: "main#index"

	namespace :api do

		namespace :v1 do
      match "/getCustomerDataset", to:  "customer_service#get_customer_dataset", via: :post, as: "get_customer_dataset"
			match "/getCustomer/:id", to: "customer_service#get_customer", via: :get, as: 'get_customer'
			match "/upsertCustomer", to: "customer_service#create_customer", via: :post, as: "create_customer"
			match "/getUpdatedCustomers", to: "customer_service#get_updated_customers", via: :get, as: "get_updated_customers"
		end
	end

end
