require "spec_helper"

feature "Users can edit existing projects" do
    before do
      FactoryGirl.create(:project, name: "Sublime Text 3")
        
        visit "/"
        first(:link, "Sublime Text 3").click
        click_link "Edit Project"
    end

  scenario "with valid attributes" do
    fill_in "Name", with: "Sublime Text 4 beta"
    click_button "Update Project"

    page.should have_content "Project has been updated."
    page.should have_content "Sublime Text 4 beta"
  end
  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Project"
  
    page.should have_content "Project has not been updated."
  end
end