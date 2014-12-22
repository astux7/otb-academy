require "spec_helper"

feature "testing application" do
  scenario "testing home page" do
    visit '/'
    expect(page).to have_content("Hello world!")
  end
end