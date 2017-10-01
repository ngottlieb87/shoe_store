require('spec_helper')

  describe 'The store creation path', {:type=>:feature} do
    it 'lets the user create stores and add them to a list' do
      visit '/add_store'
      fill_in('name', :with => "Tina's Shoe Shop")
      click_button("Add Store")
      expect(page).to have_content("Tina's Shoe Shop")
    end
  end
