class Product < ActiveRecord::Base
  validates_presence_of :name, :price, :delivery

  def physical?
    if self.delivery == 'physical'
      return true
    else
      return false
    end
  end
end
