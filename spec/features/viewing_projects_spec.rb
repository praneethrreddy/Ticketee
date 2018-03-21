require "spec_helper"

feature "Users can view projects" do
  scenario "with the project details" do
    project = FactoryGirl.create(:project, name: "Sublime Text 3")

    visit "/"
   # click_link "Sublime Text 3"
    first(:link, "Sublime Text 3").click
   # page.current_url.should eq project_url(project)
  end
end