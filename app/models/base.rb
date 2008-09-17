require 'account'
require 'accommodation'
require 'location'
require 'listing'
require 'multiple_listing_system'
require 'picture'
require 'price'
require 'specification'
require 'upload'
require 'user'
require 'yacht'
class ActiveRecord::Base
  def update_attributes_with_yacht_manager(*args)
    @associated_attributes = self.class.extract_associated_attributes!(*args) unless args.nil? || args.empty?
    update_attributes_without_yacht_manager(*args)
  end    
  alias_method_chain :update_attributes, :yacht_manager

  def initialize_with_yacht_manager(*args)
    @associated_attributes = self.class.extract_associated_attributes!(*args) unless args.nil? || args.empty?
    initialize_without_yacht_manager(*args)
  end    
  alias_method_chain :initialize, :yacht_manager

  def save_with_yacht_manager(*args)
    ans = save_without_yacht_manager(*args)
    if @associated_attributes and ans
      temp = @associated_attributes
      @associated_attributes = nil # stop infinite loop
      associate(temp) 
    end
    ans
  end    
  alias_method_chain :save, :yacht_manager

  private
    def associate(attributes)
      attributes.each_pair do |k, v|
        old_v = self.send("#{k}_id")
        if(v.to_i != old_v.to_i)
          klass = Object.const_get("#{k.camelize}")
          if old_v
            old_attribute_model = klass.send("find", old_v.to_i)
            old_attribute_model.send(self.class.to_s.downcase.pluralize).delete(self)
  	  end	
          attribute_model = klass.send("find", v.to_i)
          attribute_model.send(self.class.to_s.downcase.pluralize) << self
        end
      end
      self
    end

    def self.has_many_relationship?(attribute)
      return false unless Object.const_defined?("#{attribute.camelize}")
      klass = Object.const_get("#{attribute.camelize}")
      new.respond_to?(attribute) and klass.new.respond_to?(to_s.downcase.pluralize)
    end

    def self.extract_associated_attributes!(attributes)
      return nil if attributes.nil?      
      id_regex = /^(.*)_id$/
      id_attributes = attributes.find_all { |k,v| k.to_s.match(id_regex) }
      id_attributes.collect! { |k,v| k.to_s.match(id_regex)[1] }
      id_attributes.delete_if { |attribute| !has_many_relationship?(attribute) }
      associated_attributes = {}
      id_attributes.each { |attribute| associated_attributes.merge!({attribute => attributes.delete("#{attribute}_id".to_sym) || 
										  attributes.delete("#{attribute}_id")})}
      associated_attributes
    end
end
