class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
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
