require 'test_helper'

class TodolistControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get todolist_new_url
    assert_response :success
  end

end
