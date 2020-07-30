require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_job_url
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post jobs_url, params: { job: { company_name: @job.company_name, company_website: @job.company_website, compensation_range: @job.compensation_range, link_to_apply: @job.link_to_apply, remote: @job.remote, role_type: @job.role_type, title: @job.title, user_id: @job.user_id, years_of_experience: @job.years_of_experience } }
    end

    assert_redirected_to job_url(Job.last)
  end

  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_url(@job)
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { company_name: @job.company_name, company_website: @job.company_website, compensation_range: @job.compensation_range, link_to_apply: @job.link_to_apply, remote: @job.remote, role_type: @job.role_type, title: @job.title, user_id: @job.user_id, years_of_experience: @job.years_of_experience } }
    assert_redirected_to job_url(@job)
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete job_url(@job)
    end

    assert_redirected_to jobs_url
  end
end
