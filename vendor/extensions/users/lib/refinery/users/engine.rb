module Refinery
  module Users
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Users

      engine_name :refinery_users

      initializer "register refinerycms_users plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "users"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.users_admin_users_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/users/user',
            :title => 'first_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Users)
      end
    end
  end
end
