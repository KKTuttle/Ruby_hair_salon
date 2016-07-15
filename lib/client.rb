class Client
  attr_reader(:id, :client_name, :stylist_id)

  define_method(:initialize) do |attributes|
    @id = attributes[:id].to_i()
    @client_name =attributes[:client_name]
    @stylist_id = attributes[:stylist_id]
  end

  define_singleton_method(:all) do
    resturned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    resturned_clients.each() do |client|
      id = client['id'].to_i()
      client_name = client['client_name']
      stylist_id = client['stylist_id'].to_i()
      clients.push(Client.new({:id => id, :client_name => client_name, :stylist_id => stylist_id}))
    end
    clients
  end



end
