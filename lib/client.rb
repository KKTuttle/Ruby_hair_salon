class Client
  attr_reader(:id, :client_name, :stylist_id)

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
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

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (client_name, stylist_id) VALUES ('#{@client_name}', #{@stylist_id}) RETURNING id;")
    @id = result.first()['id'].to_i()
  end

  define_method(:==) do |another_client|
    self.id().==(another_client.id()).&(self.client_name().==(another_client.client_name())).&(self.stylist_id().==(another_client.stylist_id()))
  end

  define_singleton_method(:find) do |id|
    found_client = nil
    Client.all().each() do |client|
      if client.id().==(id)
        found_client = client
      end
    end
    found_client
  end

end
