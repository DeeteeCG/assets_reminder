class Item < ApplicationRecord

  geocoded_by :shop_location
  after_validation :geocode

  belongs_to :user


  def self.search(search)
    # search = search.downcase
    self.where("item_name ILIKE ? OR
                brand ILIKE ?",
                "%#{search}%",
                "%#{search}%")
  end


end
