class Menu < ActiveRecord::Base
  has_many :menu_items

  def to_string
    "Id: #{id} Name: #{name}"
  end

  def self.to_list
    all.map { |x| x.to_string }
  end
end
