require('spec_helper')

describe(Client) do
  describe('.all') do
    it "will be empty at the beginning" do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it "saves a client into database" do
      test_client = Client.new({:id => nil, :client_name => 'Mason', :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end
  describe("#==") do
    it "is the same client if it has the the same info" do
      test_client = Client.new({:id => nil, :client_name => 'Mason', :stylist_id => 1})
      test_client2 = Client.new({:id => nil, :client_name => 'Mason', :stylist_id => 1})
      expect(test_client).to(eq(test_client2))
    end
  end

end
