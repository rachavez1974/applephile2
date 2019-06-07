class City
  attr_accessor :name, :state, :keyword, :city_url, :items
  @@all = []

  def initialize(city_attributes)
    city_attributes.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end
end
