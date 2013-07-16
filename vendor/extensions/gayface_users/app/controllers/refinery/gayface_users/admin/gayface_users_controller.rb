module Refinery
  module GayfaceUsers
    module Admin
      class GayfaceUsersController < ::Refinery::AdminController

        crudify :'refinery/gayface_users/gayface_user',
                :title_attribute => 'first_name', :xhr_paging => true

      end
    end
  end
end
