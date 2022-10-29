require "test_helper"

class Admin::CertificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_certifications_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_certifications_edit_url
    assert_response :success
  end
end
