class TrailsGuideSerializer
  include FastJsonapi::ObjectSerializer
  set_type :trail
  attributes :location, :forecast, :trails
end
