# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "GayfaceUsers" do
    describe "Admin" do
      describe "gayface_users" do
        login_refinery_user

        describe "gayface_users list" do
          before do
            FactoryGirl.create(:gayface_user, :first_name => "UniqueTitleOne")
            FactoryGirl.create(:gayface_user, :first_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.gayface_users_admin_gayface_users_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.gayface_users_admin_gayface_users_path

            click_link "Add New Gayface User"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "First Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::GayfaceUsers::GayfaceUser.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("First Name can't be blank")
              Refinery::GayfaceUsers::GayfaceUser.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:gayface_user, :first_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.gayface_users_admin_gayface_users_path

              click_link "Add New Gayface User"

              fill_in "First Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::GayfaceUsers::GayfaceUser.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:gayface_user, :first_name => "A first_name") }

          it "should succeed" do
            visit refinery.gayface_users_admin_gayface_users_path

            within ".actions" do
              click_link "Edit this gayface user"
            end

            fill_in "First Name", :with => "A different first_name"
            click_button "Save"

            page.should have_content("'A different first_name' was successfully updated.")
            page.should have_no_content("A first_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:gayface_user, :first_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.gayface_users_admin_gayface_users_path

            click_link "Remove this gayface user forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::GayfaceUsers::GayfaceUser.count.should == 0
          end
        end

      end
    end
  end
end
