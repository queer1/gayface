module Refinery
  module Users
    module Admin
      class UsersController < ::Refinery::AdminController

        crudify :'refinery/users/user',
                :title_attribute => 'first_name', :xhr_paging => true

      end
    end
  end
end
