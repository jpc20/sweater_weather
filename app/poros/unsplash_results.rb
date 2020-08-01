class UnsplashResults
  def get_image(location)
    UnsplashService.new.get_image(location)
  end
end
