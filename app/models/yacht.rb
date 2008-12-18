class Yacht < ActiveRecord::Base
  has_many :listings
  has_many :accommodations, :dependent=>:destroy
  has_many :pictures, :dependent=>:destroy
  belongs_to :specification, :dependent=>:destroy
  belongs_to :location, :dependent=>:destroy

  def to_s
    specification.to_s
  end

  def to_yt
    {:name=>name,:manufacturer=>specification.manufacturer, 
     :model=>specification.model, :category=>"sample_category",
     :description=>specification.description,
     :rig=>"smaple_rig", :cockpit=>"sample_cockpit", 
     :flag=>"sample_flag",:number_of_staterooms=>4,
     :new=>new?, :type=>specification.type, :year=>specification.year,

     :length=>measurement_to_yt(specification.length, specification.length_units),
     :lwl=>measurement_to_yt(specification.lwl, specification.length_units), 
     :loa=>measurement_to_yt(specification.loa, specification.length_units), 
     :beam=>measurement_to_yt(specification.beam, specification.length_units), 
     :min_draft=>measurement_to_yt(specification.min_draft, specification.length_units), 
     :max_draft=>measurement_to_yt(specification.max_draft, specification.length_units), 
     :bridge_clearance=>measurement_to_yt(specification.bridge_clearance, specification.length_units),
     :displacement=>measurement_to_yt(specification.displacement, specification.weight_units),
     :ballast=>measurement_to_yt(specification.ballast, specification.weight_units),
     :cruise_speed=>measurement_to_yt(specification.cruise_speed, specification.speed_units),
     :max_speed=>measurement_to_yt(specification.max_speed, specification.speed_units),

     :hull=>{:configuration=>"sample_configuration", :material=>specification.hull_material,
     :color=>"sample_color", :designer=>specification.designer}.delete_bad_values,

     :fuel_tank=> tank_to_yt(nil, specification.fuel_tank_capacity),
     :water_tank=> tank_to_yt(nil, specification.water_tank_capacity),
     :holding_tank=> tank_to_yt(nil, specification.holding_tank_capacity),
     :engines=>[{:manufacturer=>specification.engine_manufacturer, :model=>specification.engine_model,
  		 :fuel=>specification.fuel,:horsepower=>specification.engine_horsepower, 
		 :year=>specification.engine_year, :hours=>specification.engine_hours}.delete_bad_values] * specification.number_of_engines,
     :location=>location.to_yt, 
     :accommodations=>accommodations.collect { |a| a.to_yt },
     :pictures=>pictures.collect { |p| p.to_yt }
    }.delete_bad_values
  end

  private
    def tank_to_yt(material, capacity)
      ans = {:material=>material}
      ans.merge!({:capacity=> measurement_to_yt(capacity, specification.volume_units)}) if(capacity)
      ans.delete_bad_values
    end

    def measurement_to_yt(value, units)
      (value) ? {:value=>value, :units=>units} : {}
    end
end
