require('spec_helper')
# require("rspec")
# require("stylist")

describe(Stylist) do
  describe(".all") do
    it "is empty at the beginning" do
      expect(Stylist.all()).to(eq([]))
    end
  end

  

end
