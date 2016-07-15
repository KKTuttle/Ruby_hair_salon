class Stylist
  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
    @name = attributes[:name]
  end

  define_singleton_method(:all) do
    returned_stylists = Db.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      id = stylist[]
end
