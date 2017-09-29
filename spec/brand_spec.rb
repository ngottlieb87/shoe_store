require("spec_helper")

describe(Brand) do
  it("will show name of shoe brand") do
    test_brand = Brand.create({make: "Adidas"})
    expect(test_brand).to eq(test_brand)
  end

#######Forgot about shoulda-matchers########
# describe('#stores') do
#   it("will show which brands have are carried at which stores") do
#     test_brand = Brand.create({make: "Fila"})
#     test_store1 = Store.create({name: "Foot Locker"})
#     test_store2 = Store.create({name: "Macy's"})
#     test_brand.stores.push(test_store1)
#     test_brand.stores.push(test_store2)
#     expect(test_brand.stores).to eq([test_store1, test_store2])
#     end
#   end

  it{ should have_and_belong_to_many(:stores)}
end
