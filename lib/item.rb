class Item
  @@list = []
  attr_reader :id, :rank
  attr_accessor :name

  def initialize(name, rank)
    @name = name
    @rank = rank.to_i
    @id = @@list.length + 1
  end

  def self.all()
    @@list
  end

  def self.duplicate?(name, rank)
    @@list.each do |item|
      if item.rank  == rank || item.name == name
        return true
      end
    end
    false
  end

  def self.find(id)
    item_id = id.to_i()
    @@list.each do |item|
      if item.id == item_id
        return item
      end
    end
  end

  def save()
    @@list.push(self)
  end

  def self.clear()
    @@list = []
  end
end
