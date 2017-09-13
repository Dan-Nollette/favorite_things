require('item')
require('rspec')

describe("Item.all") do
  it("is empty at first") do
    expect(Item.all()).to(eq([]))
  end
end

describe("Item#save") do
  it("saves an item to the list of items") do
    item = Item.new("tacos")
    item.save()
    expect(Item.all()).to(eq([item]))
  end
end
