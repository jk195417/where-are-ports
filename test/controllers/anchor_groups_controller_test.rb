require 'test_helper'

class AnchorGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anchor_group = anchor_groups(:one)
  end

  test "should get index" do
    get anchor_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_anchor_group_url
    assert_response :success
  end

  test "should create anchor_group" do
    assert_difference('AnchorGroup.count') do
      post anchor_groups_url, params: { anchor_group: {  } }
    end

    assert_redirected_to anchor_group_url(AnchorGroup.last)
  end

  test "should show anchor_group" do
    get anchor_group_url(@anchor_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_anchor_group_url(@anchor_group)
    assert_response :success
  end

  test "should update anchor_group" do
    patch anchor_group_url(@anchor_group), params: { anchor_group: {  } }
    assert_redirected_to anchor_group_url(@anchor_group)
  end

  test "should destroy anchor_group" do
    assert_difference('AnchorGroup.count', -1) do
      delete anchor_group_url(@anchor_group)
    end

    assert_redirected_to anchor_groups_url
  end
end
