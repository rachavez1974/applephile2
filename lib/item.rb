class Item
  attr_accessor :name, :city, :price, :description, :url, :condition
  
  def initialize(item_attributes)
    item_attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  


end