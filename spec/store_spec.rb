require('spec_helper')

describe(Store) do
  it { should have_and_belong_to_many(:brands)}

  it("ensures length of store input does not exceed 100 characters") do
    store = Store.new({name: "x".*(101)})
    expect(store.save()).to eq(false)
  end
  it("returns error for blank field for store name") do
    store= Store.new({name: " "})
    expect(store.save()).to eq(false)
  end
end
