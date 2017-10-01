require('spec_helper')

describe 'The brand creation path', {:type => :feature} do
  it 'lets the user add shoes' do
    visit "/add_shoes"
    fill_in('make', :with => "Reebok")
    fill_in('price', :with => 78)
    click_button('Add Shoes')
    expect(page).to have_content("Reebok", "$78.00")
  end
end
