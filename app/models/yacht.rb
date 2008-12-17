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

     :length=>{:value=>specification.length, :units=>specification.length_units}, 
     :lwl=>{:value=>specification.lwl, :units=>specification.length_units}, 
     :loa=>{:value=>specification.loa, :units=>specification.length_units}, 
     :beam=>{:value=>specification.beam, :units=>specification.length_units}, 
     :min_draft=>{:value=>specification.min_draft, :units=>specification.length_units}, 
     :max_draft=>{:value=>specification.max_draft, :units=>specification.length_units}, 
     :bridge_clearance=>{:value=>specification.bridge_clearance, :units=>specification.length_units},
     :displacement=>{:value=>specification.displacement, :units=>specification.weight_units},
     :ballast=>{:value=>specification.ballast, :units=>specification.weight_units},
     :cruise_speed=>{:value=>specification.cruise_speed, :units=>specification.speed_units},
     :max_speed=>{:value=>specification.max_speed, :units=>specification.speed_units},

     :hull=>{:configuration=>"sample_configuration", :material=>specification.hull_material,
     :color=>"sample_color", :designer=>specification.designer},

     :fuel_tank=>{:material=>"sample_material",
		  :capacity=> { :value=>specification.fuel_tank_capacity, :units=>specification.volume_units}},
     :water_tank=>{:material=>"sample_material",
		  :capacity=> { :value=>specification.water_tank_capacity, :units=>specification.volume_units}},
     :holding_tank=>{:material=>"sample_material",
		  :capacity=> { :value=>specification.holding_tank_capacity, :units=>specification.volume_units}},
     :engines=>[{:manufacturer=>specification.engine_manufacturer, :model=>specification.engine_model,
  		 :fuel=>specification.fuel,:horsepower=>specification.engine_horsepower, 
		 :year=>specification.engine_year, :hours=>specification.engine_hours}] * specification.number_of_engines,

     :location=>location.to_yt, 
     :accommodations=>accommodations.collect { |a| a.to_yt },
     :pictures=>pictures.collect { |p| p.to_yt }
    }
  end

end
