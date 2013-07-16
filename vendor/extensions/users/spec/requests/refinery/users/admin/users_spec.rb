# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Users" do
    describe "Admin" do
      describe "users" do
        login_refinery_user

        describe "users list" do
          before do
            FactoryGirl.create(:user, :first_name => "UniqueTitleOne")
            FactoryGirl.create(:user, :first_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.users_admin_users_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.users_admin_users_path

            click_link "Add New User"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "First Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Users::User.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("First Name can't be blank")
              Refinery::Users::User.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:user, :first_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.users_admin_users_path

              click_link "Add New User"

              fill_in "First Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Users::User.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:user, :first_name => "A first_name") }

          it "should succeed" do
            visit refinery.users_admin_users_path

            within ".actions" do
              click_link "Edit this user"
            end

            fill_in "First Name", :with => "A different first_name"
            click_button "Save"

            page.should have_content("'A different first_name' was successfully updated.")
            page.should have_no_content("A first_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:user, :first_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.users_admin_users_path

            click_link "Remove this user forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Users::User.count.should == 0
          end
        end

      end
    end
  end
end
