class Train < ApplicationRecord
  belongs_to :route
  has_many :vagons
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  validates :number, presence: true

  def count_vagons(v_type)
    vagons.where(v_type: v_type).size
  end

  def count_low_places(v_type)
    vagons.where(v_type: v_type).sum(:num_low_places)
  end

  def count_hi_places(v_type)
    vagons.where(v_type: v_type).sum(:num_hi_places)
  end

  def add_vagon(vagon)
    vagons << vagon unless vagons.include(vagon)
  end

end
