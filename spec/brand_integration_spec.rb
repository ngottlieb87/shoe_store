require('spec_helper')

describe 'The brand creation path', {:type => :feature} do

  it 'lets the user add shoes' do
    visit "/add_shoes"
    fill_in('make', :with => "Reebok")
    fill_in('price', :with => 78)
    click_button('Add Shoes')
    expect(page).to have_content("Reebok", "$78.00")
  end

  it "will delete shoe brand and price" do
    test_brand = Brand.create({make:"Reebok", price: 98})
    visit "/add_shoes"
    find(:css, "#shoeID[value='#{test_brand.id}']").set(true)
    click_button("Delete Shoes")
    expect(page).to have_content("There are currently no shoe brands")
  end

  it "will take redirect to error page if no selection occurred" do
    test_brand = Brand.create({make:"Reebok", price: 98})
    visit "/add_shoes"
    click_button("Delete Shoes")
    expect(page).to have_content("Looks like something went wrong!")
  end
end
