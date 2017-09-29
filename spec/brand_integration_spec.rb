require('spec_helper')

describe 'The brand creation path', {:type => :feature} do
  it 'lets the user add shoes brands to a store' do
    test_store= Store.new({name: "Target", id: nil})
    test_store.save()
    id = test_store.id
    visit "/add_shoes/#{id}"
    fill_in('make', :with => "Reebok")
    fill_in('price', :with => "12.00")
    expect(page).to have_content("Reebok", "12.00")
  end
end
