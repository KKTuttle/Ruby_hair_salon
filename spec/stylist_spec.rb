require('spec_helper')


describe(Stylist) do

  describe(".all") do
    it "is empty at the beginning" do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it "saves a new stylist to the database" do
      test_stylist = Stylist.new({:id => nil, :name => 'Katie'})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe("#name") do
    it "resturns a new of the stylist" do
      test_stylist = Stylist.new({:id => nil, :name => 'Katie'})
      expect(test_stylist.name()).to(eq("Katie"))
    end
  end

  describe("#id") do
    it "resturn id number of a stylist" do
      test_stylist = Stylist.new({:id => nil, :name => 'Katie'})
      test_stylist.save()
      expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end


  describe("#==") do
    it "is the same stylist if stylist has the same info" do
      test_stylist  = Stylist.new({:id => nil, :name => 'Katie'})
      test_stylist2  = Stylist.new({:id => nil, :name => 'Katie'})
      expect(test_stylist).to(eq(test_stylist2))
    end
  end

  describe('.find') do
    it "returns a stylist by an id number" do
      test_stylist = Stylist.new({:id => nil, :name => 'Katie'})
      test_stylist.save()
      test_stylist2 = Stylist.new({:id => nil, :name => 'Julia'})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

end
