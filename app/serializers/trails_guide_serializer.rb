class TrailsGuideSerializer
  include FastJsonapi::ObjectSerializer
  set_type :trail
  attributes :location, :trails
end