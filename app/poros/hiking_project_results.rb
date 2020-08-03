class HikingProjectResults
  def get_trails(location)
    trails_resp = HikingProjectService.new.get_trails(location)

  end
end
