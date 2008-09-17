require 'yacht_transfer'
module YachtManagerHelper
  def self.included(model)
    model.extend(ClassMethods)
  end

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

  STATES = YachtTransfer::Models::State.names.sort { |a,b| a.to_s <=> b.to_s }
  COUNTRIES = YachtTransfer::Models::Country.names.sort { |a,b| a.to_s <=> b.to_s }
  STATUSES = YachtTransfer::Standards::STATUS_TRANSFORM.keys.sort { |a,b| a.to_s <=> b.to_s }
  CURRENCIES = YachtTransfer::Standards::PRICE_UNITS_TRANSFORM.keys.sort { |a,b| a.to_s <=> b.to_s }
  YACHT_TYPES = YachtTransfer::Standards::YACHT_TYPE_TRANSFORM.keys.sort { |a,b| a.to_s <=> b.to_s }
  HULL_MATERIALS = YachtTransfer::Standards::MATERIAL_TRANSFORM.keys.sort { |a,b| a.to_s <=> b.to_s }
  LENGTH_UNITS = YachtTransfer::Standards::DISTANCE_UNITS_TRANSFORM.keys.sort { |a,b| a.to_s <=> b.to_s }
  WEIGHT_UNITS = [:pounds, :tons, :kilograms] #YachtTransfer::Standards::_TRANSFORM.keys.sort { |a,b| a.to_s <=> b.to_s }
  VOLUME_UNITS= [:liters, :gallons] #YachtTransfer::Standards::MATERIAL_TRANSFORM.keys.sort { |a,b| a.to_s <=> b.to_s }
  SPEED_UNITS = [:mph, :knots] #YachtTransfer::Standards::MATERIAL_TRANSFORM.keys.sort { |a,b| a.to_s <=> b.to_s }
  FUELS = YachtTransfer::Standards::FUEL_TRANSFORM.keys.sort { |a,b| a.to_s <=> b.to_s }

#view helpers
  def state_select; select(:location, :state_id, options_with_ids(STATES)); end
  def country_select; select(:location, :country_id, options_with_ids(COUNTRIES)); end
  def status_select; select(:listing, :status_id, options_with_ids(STATUSES)); end
  def currency_select; select(:price, :currency_id, options_with_ids(CURRENCIES)); end
  def yacht_type_select; select(:specification, :type_id, options_with_ids(YACHT_TYPES)); end
  def hull_material_select;  select(:specification, :hull_material_id, options_with_ids(HULL_MATERIALS)); end
  def length_units_select;  select(:specification, :length_units_id, options_with_ids(LENGTH_UNITS)); end
  def weight_units_select;  select(:specification, :weight_units_id, options_with_ids(WEIGHT_UNITS)); end
  def volume_units_select;  select(:specification, :volume_units_id, options_with_ids(VOLUME_UNITS)); end
  def speed_units_select;  select(:specification, :speed_units_id, options_with_ids(SPEED_UNITS)); end
  def fuel_select;  select(:specification, :engine_fuel_id, options_with_ids(FUELS)); end

## model helpers

  def state; STATES[state_id-1]; end
  def country; COUNTRIES[country_id-1]; end
  def status; STATUSES[status_id-1]; end
  def currency; CURRENCIES[currency_id-1]; end
  def type; YACHT_TYPES[type_id-1]; end
  def hull_material; HULL_MATERIALS[hull_material_id-1]; end
  def length_units; LENGTH_UNITS[length_units_id-1]; end
  def weight_units; WEIGHT_UNITS[weight_units_id-1]; end
  def volume_units; VOLUME_UNITS[volume_units_id-1]; end
  def speed_units; SPEED_UNITS[speed_units_id-1]; end
  def fuel; FUELS[engine_fuel_id-1]; end

  module ClassMethods
    def validates_state; validates_inclusion_of :state_id, :in => 1..STATES.length; end
    def validates_country; validates_inclusion_of :country_id, :in => 1..COUNTRIES.length; end
    def validates_status; validates_inclusion_of :status_id, :in => 1..STATUSES.length; end
    def validates_currency; validates_inclusion_of :currency_id, :in => 1..CURRENCIES.length; end
    def validates_yacht_type; validates_inclusion_of :type_id, :in => 1..YACHT_TYPES.length; end
    def validates_hull_material; validates_inclusion_of :hull_material_id, :in => 1..HULL_MATERIALS.length; end
    def validates_length_units; validates_inclusion_of :length_units_id, :in => 1..LENGTH_UNITS.length; end
    def validates_weight_units; validates_inclusion_of :weight_units_id, :in => 1..WEIGHT_UNITS.length; end
    def validates_volume_units; validates_inclusion_of :volume_units_id, :in => 1..VOLUME_UNITS.length; end
    def validates_speed_units; validates_inclusion_of :speed_units_id, :in => 1..SPEED_UNITS.length; end
    def validates_fuel; validates_inclusion_of :engine_fuel_id, :in => 1..FUELS.length; end
  end

  private
    def options_with_ids(array)
      options = []
      array.each_with_index { |name,n|  options << [name,n+1] }
      options
    end
end
