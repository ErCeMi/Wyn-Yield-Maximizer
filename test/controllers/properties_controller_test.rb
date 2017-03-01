require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get properties_url
    assert_response :success
  end

  test "should get new" do
    get new_property_url
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post properties_url, params: { property: { amenities: @property.amenities, bedroom: @property.bedroom, company_id: @property.company_id, group: @property.group, lease_from: @property.lease_from, lease_to: @property.lease_to, move_in: @property.move_in, move_out: @property.move_out, name: @property.name, resident_name: @property.resident_name, resident_rent: @property.resident_rent, status: @property.status, tenantid: @property.tenantid, unit: @property.unit, unit_type: @property.unit_type, days_vacant: @property.days_vacant } }
    end

    assert_redirected_to property_url(Property.last)
  end

  test "should show property" do
    get property_url(@property)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_url(@property)
    assert_response :success
  end

  test "should update property" do
    patch property_url(@property), params: { property: { amenities: @property.amenities, bedroom: @property.bedroom, company_id: @property.company_id, group: @property.group, lease_from: @property.lease_from, lease_to: @property.lease_to, move_in: @property.move_in, move_out: @property.move_out, name: @property.name, resident_name: @property.resident_name, resident_rent: @property.resident_rent, status: @property.status, tenantid: @property.tenantid, unit: @property.unit, unit_type: @property.unit_type, days_vacant: @property.days_vacant } }
    assert_redirected_to property_url(@property)
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete property_url(@property)
    end

    assert_redirected_to properties_url
  end
end
