class HikingProjectResults
  def get_trails(location)
    trails_resp = HikingProjectService.new.get_trails(location)
    trails_resp[:trails].map do |trail_data|
      Trail.new(trail_data)
    end
  end
end
