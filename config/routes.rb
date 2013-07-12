EpicorSoapConnector::Application.routes.draw do

	root to: "main#index"

	match "/", to: "main#index"

	namespace :api do

		namespace :v1 do
			match "/get_customer/:id", to: "customer_service#get_customer", via: :get, as: 'get_customer'
			match "/create_customer", to: "customer_service#create_customer", via: :post, as: "create_customer"
			match "/get_updated_customers", to: "customer_service#get_updated_customers", via: :get, as: "get_updated_customers"

			match "/create_customer_contact", to: "customer_contact_service#create_customer_contact", via: :post, as: "create_customer_contact"
			match "/get_customer_contact/:id", to: "customer_contact_service#get_customer_contact", via: :get, as: "get_customer_contact"
			match "/get_update_customer_contacts", to: "customer_contact_service#get_updated_customer_contacts", via: :get, as: "get_updated_customer_contacts"
		end
	end

end
