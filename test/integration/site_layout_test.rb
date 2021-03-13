require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "layouts links" do
    get root_path
    assert_template 'static_pages/home'
  end
end
