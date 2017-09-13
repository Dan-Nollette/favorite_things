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
      item = Item.new("tacos")
      item.save()
      expect(Item.all()).to(eq([item]))
    end
  end

  describe(".clear") do
    it("clears all items from the list") do
      item = Item.new("tacos")
      item.save()
      Item.clear()
      expect(Item.all()).to(eq([]))
    end
  end
  describe("#name") do
    it("returns the item's name value") do
      item = Item.new("tacos")
      expect(item.name()).to(eq("tacos"))
    end
  end
  describe("#name") do
    it("changes the item's name value") do
      item = Item.new("tacos")
      item.name = "tortilla chips"
      expect(item.name()).to(eq("tortilla chips"))
    end
  end
end
