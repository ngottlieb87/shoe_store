require('spec_helper')

  describe 'The store creation path', {:type=>:feature} do

    it 'lets the user create stores and add them to a list' do
      visit '/add_store'
      fill_in('name', :with => "Tina's Shoe Shop")
      click_button("Add Store")
      expect(page).to have_content("Tina's Shoe Shop")
    end

    it "it will add shoes and price to a store" do
      test_store = Store.new({name:"FootLocker"})
      test_store.save
      id = test_store.id
      visit "/add_shoes_to_store/#{id}"
      fill_in('make', :with => "Puma")
      fill_in('price', :with => 87)
      click_button("Add Shoes")
      expect(page).to have_content("Puma", 87)

    end

    it "will delete store from list" do
      test_store = Store.create({name:"FootLocker"})
      visit "/add_store"
      find(:css, "#storeID[value='#{test_store.id}']").set(true)
      click_button("Delete Selected Stores")
      expect(page).to have_content("There are currently no stores")
    end

    it "will update store name" do
      test_store= Store.create({name: "FootLocker"})
      test_store.save
      id = test_store.id
      visit "/add_shoes_to_store/#{id}"
      fill_in('name', :with => "Varnery's")
      click_button("Update Store")
      expect(page).to have_content("Varnery's")
    end

  end
