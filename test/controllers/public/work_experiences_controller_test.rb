require "test_helper"

class Public::WorkExperiencesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_work_experiences_edit_url
    assert_response :success
  end

  test "should get show" do
    get public_work_experiences_show_url
    assert_response :success
  end
end
