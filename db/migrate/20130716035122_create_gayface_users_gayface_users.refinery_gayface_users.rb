# This migration comes from refinery_gayface_users (originally 1)
class CreateGayfaceUsersGayfaceUsers < ActiveRecord::Migration

  def up
    create_table :refinery_gayface_users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :gayface_photo_id
      t.string :city
      t.string :state
      t.string :sexual_identification
      t.string :occupation
      t.text :blurb
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-gayface_users"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/gayface_users/gayface_users"})
    end

    drop_table :refinery_gayface_users

  end

end
