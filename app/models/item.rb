class Item < ApplicationRecord

  geocoded_by :shop_location
  after_validation :geocode

  validates :item_name, length: {minimum: 3, message: "Item name too short"}, presence: true

  validates :deadline, presence: true
  validate :deadline_should_be_after_today, if: Proc.new {|a| !a.deadline.nil?}

  belongs_to :user


  def self.search(search)
    # search = search.downcase
    self.where("item_name ILIKE ? OR
                brand ILIKE ?",
                "%#{search}%",
                "%#{search}%")
  end

  def deadline_should_be_after_today
    if deadline <= Date.today
      errors.add(:deadline, "can't be in the past or today")
    end
  end



end
