require("spec_helper")

describe(Brand) do

  it{ should have_and_belong_to_many(:stores)}

  it("ensures length of brand input does not exceed 100 characters") do
    brand = Brand.new({make: "x".*(101)})
    expect(brand.save()).to eq(false)
  end

  it("returns error for blank field for shoe brand") do
    brand= Brand.new({make: " "})
    expect(brand.save()).to eq(false)
  end

  it("returns error for blank field for shoe price") do
    brand= Brand.new({price: " "})
    expect(brand.save()).to eq(false)
  end

  it("will show name of shoe brand") do
    test_brand = Brand.create({make: "Adidas"})
    expect(test_brand).to eq(test_brand)
  end
end
