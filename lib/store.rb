class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, {:presence=> true, :length => {:maximum => 100}})
  validates(:name, uniqueness: {case_sensitive: false})
  before_save(:upcase_name)


private

  def upcase_name
    name_arr = self.name.split
    name_arr.each do |n|
      n.capitalize!
    end
    self.name = name_arr.join(' ')
  end
end
