require "spec_helper"

feature "Users can delete projects" do
  scenario "successfully" do
    FactoryGirl.create(:project, name: "Sublime Text 3")

    visit "/"
    first(:link, "Sublime Text 3").click
    click_link "Delete Project"

    page.should have_content "Project has been deleted."
    #page.current_url.should eq projects_url
    #page.should have_no_content "Sublime Text 3"
  end
end