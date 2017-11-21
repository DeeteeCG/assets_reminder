class Item < ApplicationRecord
  belongs_to :user


  def self.search(search)
    # search = search.downcase
    self.where("item_name ILIKE ? OR
                brand ILIKE ?",
                "%#{search}%",
                "%#{search}%")
  end


end
