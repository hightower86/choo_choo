class Train < ApplicationRecord
  belongs_to :route
  has_many :vagons
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  validates :number, presence: true

  def add_vagon(vagon)
    vagons << vagon unless vagons.include(vagon)
  end

  def get_num_places(type_vagon, type_place)
    self.vagons.where(type: type_vagon).sum(type_place)
  end


end
