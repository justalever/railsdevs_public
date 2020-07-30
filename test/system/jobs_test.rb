require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "creating a Job" do
    visit jobs_url
    click_on "New Job"

    fill_in "Company name", with: @job.company_name
    fill_in "Company website", with: @job.company_website
    fill_in "Compensation range", with: @job.compensation_range
    fill_in "Link to apply", with: @job.link_to_apply
    check "Remote" if @job.remote
    fill_in "Role type", with: @job.role_type
    fill_in "Title", with: @job.title
    fill_in "User", with: @job.user_id
    fill_in "Years of experience", with: @job.years_of_experience
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "updating a Job" do
    visit jobs_url
    click_on "Edit", match: :first

    fill_in "Company name", with: @job.company_name
    fill_in "Company website", with: @job.company_website
    fill_in "Compensation range", with: @job.compensation_range
    fill_in "Link to apply", with: @job.link_to_apply
    check "Remote" if @job.remote
    fill_in "Role type", with: @job.role_type
    fill_in "Title", with: @job.title
    fill_in "User", with: @job.user_id
    fill_in "Years of experience", with: @job.years_of_experience
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "destroying a Job" do
    visit jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job was successfully destroyed"
  end
end
