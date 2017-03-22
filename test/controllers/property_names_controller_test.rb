require 'test_helper'

class PropertyNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property_name = property_names(:one)
  end

  test "should get index" do
    get property_names_url
    assert_response :success
  end

  test "should get new" do
    get new_property_name_url
    assert_response :success
  end

  test "should create property_name" do
    assert_difference('PropertyName.count') do
      post property_names_url, params: { property_name: { lease_terms: @property_name.lease_terms } }
    end

    assert_redirected_to property_name_url(PropertyName.last)
  end

  test "should show property_name" do
    get property_name_url(@property_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_name_url(@property_name)
    assert_response :success
  end

  test "should update property_name" do
    patch property_name_url(@property_name), params: { property_name: { lease_terms: @property_name.lease_terms } }
    assert_redirected_to property_name_url(@property_name)
  end

  test "should destroy property_name" do
    assert_difference('PropertyName.count', -1) do
      delete property_name_url(@property_name)
    end

    assert_redirected_to property_names_url
  end
end
