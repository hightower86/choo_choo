class Search < ApplicationRecord

  def find_routes(start_station, end_station)
    @routes = Route.find([start_station, end_station])
  end

end
