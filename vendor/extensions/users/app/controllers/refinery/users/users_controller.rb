module Refinery
  module Users
    class UsersController < ::ApplicationController

      before_filter :find_all_users
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @user in the line below:
        present(@page)
      end

      def show
        @user = User.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @user in the line below:
        present(@page)
      end

    protected

      def find_all_users
        @users = User.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/users").first
      end

    end
  end
end
