class EconomyVagon < Vagon
   validates :num_hi_places, :num_low_places, :side_hi_places, :side_low_places, presence: true
end
