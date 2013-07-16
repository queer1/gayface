module Refinery
  module GayfaceUsers
    class GayfaceUsersController < ::ApplicationController

      before_filter :find_all_gayface_users
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @gayface_user in the line below:
        present(@page)
      end

      def show
        @gayface_user = GayfaceUser.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @gayface_user in the line below:
        present(@page)
      end

    protected

      def find_all_gayface_users
        @gayface_users = GayfaceUser.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/gayface_users").first
      end

    end
  end
end
