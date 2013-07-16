module Refinery
  module Locations
    class Location < Refinery::Core::BaseModel
      self.table_name = 'refinery_locations'

      attr_accessible :name, :latitude, :longitude, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
