require('item')
require('rspec')

describe("Item") do
  before() do
    Item.clear()
  end

  describe(".all") do
    it("is empty at first") do
      expect(Item.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an item to the list of items") do
      item = Item.new("tacos", "1")
      item.save()
      expect(Item.all()).to(eq([item]))
    end
  end

  describe(".clear") do
    it("clears all items from the list") do
      item = Item.new("tacos", "1")
      item.save()
      Item.clear()
      expect(Item.all()).to(eq([]))
    end
  end
  describe("#name") do
    it("returns the item's name value") do
      item = Item.new("tacos", "1")
      expect(item.name()).to(eq("tacos"))
    end
  end
  describe("#name=") do
    it("changes the item's name value") do
      item = Item.new("tacos", "1")
      item.name = "tortilla chips"
      expect(item.name()).to(eq("tortilla chips"))
    end
  end
  describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      item = Item.new("tacos", "2")
      item.save()
      item2 = Item.new("pizza", "1")
      item2.save()
      expect(item.id()).to(eq(1))
      expect(item2.id()).to(eq(2))
    end
  end
  describe(".find") do
    it("finds an item based on its id") do
      item = Item.new("tacos", "2")
      item.save()
      item2 = Item.new("pizza", "1")
      item2.save()
      expect(Item.find(1)).to(eq(item))
      expect(Item.find(2)).to(eq(item2))
    end
  end
  describe("#rank") do
    it("returns the item's rank value") do
      item = Item.new("tacos", "3")
      expect(item.rank).to(eq(3))
    end
  end
  describe(".duplicate?") do
    it("checks if inputted rank has duplicate") do
      item = Item.new("tacos", "2")
      item.save()
      expect(Item.duplicate?(2)).to(eq(true))
    end
  end
  describe(".duplicate?") do
    it("checks if inputted rank has duplicate") do
      item = Item.new("tacos", "1")
      item.save()
      expect(Item.duplicate?(4)).to(eq(false))
    end
  end
end
