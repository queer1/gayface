module Refinery
  module GayfaceUsers
    class GayfaceUser < Refinery::Core::BaseModel
      self.table_name = 'refinery_gayface_users'

      attr_accessible :first_name, :last_name, :gayface_photo_id, :city, :state, :sexual_id, :occupation, :blurb, :position

      acts_as_indexed :fields => [:first_name, :last_name, :city, :state, :sexual_id, :occupation, :blurb]

      validates :first_name, :presence => true, :uniqueness => true

      belongs_to :gayface_photo, :class_name => '::Refinery::Image'
    end
  end
end
