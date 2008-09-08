module ListingsHelper
  HIDDEN_FIELDS = ["id", "created_at", "updated_at"]
  CHECK_BOXES = ["is_central", "is_new"]
  SELECTS = ["status", "yacht_type", "length_units", "weight_units", "speed_units", "currency", "state", "country", "hull_material", "volume_units", "engine_fuel"]
  STRING_TEXT_FIELDS = ["yacht_name", "yacht_manufacturer", "yacht_model", "engine_manufacturer", "engine_model", "city", "designer"]
  NUMERIC_TEXT_FIELDS = ["yacht_year", "length", "lwl", "loa", "beam", "min_draft", "max_draft", "bridge_clearance", "displacement", "ballast", "cruise_speed", "max_speed", "price", "fuel_tank_capacity", "water_tank_capacity", "holding_tank_capacity", "engine_horsepower", "engine_year", "engine_hours", "number_of_engines"]
  TEXT_AREAS = ["yacht_description"]

  def check_boxes; CHECK_BOXES; end
  def text_fields; SELECTS+STRING_TEXT_FIELDS+NUMERIC_TEXT_FIELDS; end
  def text_areas; TEXT_AREAS; end
end
