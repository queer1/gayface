module Refinery
  module GayfaceUsers
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::GayfaceUsers

      engine_name :refinery_gayface_users

      initializer "register refinerycms_gayface_users plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "gayface_users"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.gayface_users_admin_gayface_users_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/gayface_users/gayface_user',
            :title => 'first_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::GayfaceUsers)
      end
    end
  end
end
