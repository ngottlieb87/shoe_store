class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:make, {:presence=> true, :length => {:maximum => 100}})
  before_save(:upcase_brand)


private

  def upcase_brand
    make_arr = self.make.split
    make_arr.each do |m|
      m.capitalize!
    end
    self.make = make_arr.join(' ')
  end
end
