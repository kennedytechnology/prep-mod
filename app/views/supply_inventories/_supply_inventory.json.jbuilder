json.extract! supply_inventory, :id, :received_at, :item_type, :item_name, :manufacturer, :lot_number, :expiration_date, :quantity, :packaging, :source, :product_name, :client, :created_at, :updated_at
json.url supply_inventory_url(supply_inventory, format: :json)
