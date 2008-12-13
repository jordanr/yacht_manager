# require 'yacht_transfer'
module YachtManagerHelper
#  include YachtTransfer::Rails::Helper
  # Specification field groupings
  def MAIN_TEXT_FIELDS()
    [:manufacturer, :model, :designer, :year]
  end
  def MAIN_SELECTS()
    [:hull_material_id, :type_id]
  end
  def UNITS()
    [:length_units_id, :weight_units_id, :volume_units_id, :speed_units_id]
  end
  def LENGTHS()
    [:length, :lwl, :loa, :beam, :min_draft, :max_draft, :bridge_clearance]
  end
  def WEIGHTS()
    [:displacement, :ballast]
  end
  def VOLUMES()
    [:fuel_tank_capacity, :water_tank_capacity, :holding_tank_capacity]
  end
  def SPEEDS()
    [:cruise_speed, :max_speed]
  end
  def ENGINES()
    [:engine_manufacturer, :engine_model, :engine_horsepower, :engine_year, :engine_hours, :number_of_engines]
  end
  def ENGINE_SELECTS()
    [:engine_fuel_id]
  end

end
