require('spec_helper')

describe(Client) do
  describe('.all') do
    it "will be empty at the beginning" do
      expect(Client.all()).to(eq([]))
    end
  end


end
