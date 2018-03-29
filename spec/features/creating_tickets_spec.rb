require "spec_helper"

feature "Users can create new tickets" do
  before do
    project = FactoryGirl.create(:project, name: "Internet Explorer")

    visit project_path(project)
    click_link "New Ticket"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Non-standards compliance"
    fill_in "Description", with: "My pages are ugly!"
    click_button "Create Ticket"

    page.should have_content "Ticket has been created."
  end

  scenario "when providing invalid attributes" do
    click_button "Create Ticket"

    page.should have_content "Ticket has not been created."
    page.should have_content "Name can't be blank"
    page.should have_content "Description can't be blank"
  end
  scenario "with an invalid description" do
    fill_in "Name", with: "Non-standards compliance"
    fill_in "Description", with: "It sucks"
    click_button "Create Ticket"
  
    page.should have_content "Ticket has not been created."
    page.should have_content "Description is too short"
  end
end