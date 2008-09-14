require 'yacht_transfer'
module YachtManagerHelper
  def self.included(model)
    model.extend(ClassMethods)
  end


  # Specification field groupings
  def MAIN()
    [:manufacturer, :model, :designer, :hull_material, :type, :year, :description]
  end
  def UNITS()
    [:length_units_id, :weight_units_id, :volume_units_id, :speed_units_id]
  end
  def MEASUREMENTS()
    [:length, :lwl, :loa, :beam, :min_draft, :max_draft, :bridge_clearance, :displacement, :ballast, :cruise_speed, :max_speed] +
    [:fuel_tank_capacity, :water_tank_capacity, :holding_tank_capacity]
  end
  def ENGINES()
    [:engine_manufacturer, :engine_model, :engine_fuel, :engine_horsepower, :engine_year, :engine_hours, :number_of_engines]
  end

  STATES = YachtTransfer::Models::State.names
  COUNTRIES = YachtTransfer::Models::Country.names
  STATUSES = YachtTransfer::Standards::STATUS_TRANSFORM.keys
  CURRENCIES = YachtTransfer::Standards::PRICE_UNITS_TRANSFORM.keys
  YACHT_TYPES = YachtTransfer::Standards::YACHT_TYPE_TRANSFORM.keys
  HULL_MATERIALS = YachtTransfer::Standards::MATERIAL_TRANSFORM.keys
  LENGTH_UNITS = YachtTransfer::Standards::DISTANCE_UNITS_TRANSFORM.keys
  WEIGHT_UNITS = [:pounds, :tons, :kilograms] #YachtTransfer::Standards::_TRANSFORM.keys
  VOLUME_UNITS= [:liters, :gallons] #YachtTransfer::Standards::MATERIAL_TRANSFORM.keys
  SPEED_UNITS = [:mph, :knots] #YachtTransfer::Standards::MATERIAL_TRANSFORM.keys
  FUELS = YachtTransfer::Standards::FUEL_TRANSFORM.keys

#view helpers
  def state_select; select(:location, :state_id, options_with_ids(STATES), {:include_blank => true }); end
  def country_select; select(:location, :country_id, options_with_ids(COUNTRIES), {:include_blank => true }); end
  def status_select; select(:listing, :status_id, options_with_ids(STATUSES), {:include_blank => true }); end
  def currency_select; select(:price, :currency_id, options_with_ids(CURRENCIES), {:include_blank => true }); end
  def yacht_type_select; select(:specification, :type_id, options_with_ids(YACHT_TYPES), {:include_blank=>true}); end
  def hull_material_select;  select(:specification, :hull_material_id, options_with_ids(HULL_MATERIALS), {:include_blank=>true}); end
  def length_units_select;  select(:specification, :length_units_id, options_with_ids(LENGTH_UNITS), {:include_blank=>true}); end
  def weight_units_select;  select(:specification, :weight_units_id, options_with_ids(WEIGHT_UNITS), {:include_blank=>true}); end
  def volume_units_select;  select(:specification, :volume_units_id, options_with_ids(VOLUME_UNITS), {:include_blank=>true}); end
  def speed_units_select;  select(:specification, :speed_units_id, options_with_ids(SPEED_UNITS), {:include_blank=>true}); end
  def fuel_select;  select(:specification, :engine_fuel_id, options_with_ids(FUELS), {:include_blank=>true}); end

## model helpers

  def status; STATUSES[status_id-1]; end
  def state; STATES[state_id-1]; end
  def country; COUNTRIES[country_id-1]; end
  module ClassMethods
    def validates_state; validates_inclusion_of :state_id, :in => 1..STATES.length; end
    def validates_status; validates_inclusion_of :status_id, :in => 1..STATUSES.length; end
    def validates_country; validates_inclusion_of :country_id, :in => 1..COUNTRIES.length; end
  end

  private
    def options_with_ids(array)
      options = {}
      array.sort { |a, b| a.to_s <=> b.to_s }.each_with_index { |name,n|  options.merge!(name=>n+1) }
      options
    end
end
