require 'action_view/helpers/number_helper'

class Listing < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  has_many :details, :dependent=>:destroy
  has_many :photos, :dependent=>:destroy
  has_many :transfers, :dependent=>:destroy

  validates_numericality_of :price, :yacht_specification_length, :yacht_specification_number_of_engines, :allow_nil=>true
  validates_inclusion_of :yacht_specification_year, :in => 1800..2100, :allow_nil=>true
#  validates_inclusion_of :yacht_specification_number_of_engines, :in=> 0..4, :allow_nil=>true
#  validates_inclusion_of :yacht_specification_material, :in => ["composite", "wood", "fiberglass", "steel", "other", ""], :allow_nil=>true
#  validates_inclusion_of :yacht_specification_fuel, :in => ["diesel", "gas", "other", ""], :allow_nil=>true

  before_save :add_defaults

  def to_s; "#{formated_length} #{yacht_specification_manufacturer}"; end

  def to_s2; "#{to_s} #{yacht_specification_model} #{yacht_specification_year}"; end


  def formated_price
    price.nil? ? "-" : "$#{number_with_delimiter(price)}"
  end

  def formated_length
    yacht_specification_length.nil? ? "-" : "#{yacht_specification_length}\'"
  end

  def specs
    goods = %w{
price
yacht_location
yacht_specification_length
yacht_specification_manufacturer
yacht_specification_model
yacht_specification_year
yacht_specification_material
yacht_specification_designer
yacht_specification_fuel
yacht_specification_number_of_engines 
}
#    attributes.select {|k,v| goods.include?(k.to_s) }
  end

  def to_yt
    ignores = %w{ id contact active yacht_new user_id created_at updated_at broker_id}
    goods = attributes.delete_if { |k,v| ignores.include?(k) }
    real_goods = {}
    goods.each_pair { |k, v| real_goods.merge!(k.to_sym => v.to_s) }
    real_goods.merge!(:photos=>photos.collect { |p| p.to_yt } )
  end

  private
    def add_defaults
      self.broker_id = 1 if broker_id.nil?
      self.yacht_name =  "No name" if yacht_name.nil? or yacht_name.empty?
      self.yacht_specification_manufacturer = "Custom" if yacht_specification_manufacturer.nil? or yacht_specification_manufacturer.empty?
      self.yacht_specification_number_of_engines = 1 if yacht_specification_number_of_engines.nil?
    end
end
