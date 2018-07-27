class Vagon < ApplicationRecord
  belongs_to :train
  validates :number, presence: true
  V_TYPES = ['плацкартный', 'купейный']
end
