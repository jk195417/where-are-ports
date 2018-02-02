require 'test_helper'

class AnchorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anchor = anchors(:one)
  end

  test "should get index" do
    get anchors_url
    assert_response :success
  end

  test "should get new" do
    get new_anchor_url
    assert_response :success
  end

  test "should create anchor" do
    assert_difference('Anchor.count') do
      post anchors_url, params: { anchor: { elevation: @anchor.elevation, latitude: @anchor.latitude, longitude: @anchor.longitude, what_3_words: @anchor.what_3_words } }
    end

    assert_redirected_to anchor_url(Anchor.last)
  end

  test "should show anchor" do
    get anchor_url(@anchor)
    assert_response :success
  end

  test "should get edit" do
    get edit_anchor_url(@anchor)
    assert_response :success
  end

  test "should update anchor" do
    patch anchor_url(@anchor), params: { anchor: { elevation: @anchor.elevation, latitude: @anchor.latitude, longitude: @anchor.longitude, what_3_words: @anchor.what_3_words } }
    assert_redirected_to anchor_url(@anchor)
  end

  test "should destroy anchor" do
    assert_difference('Anchor.count', -1) do
      delete anchor_url(@anchor)
    end

    assert_redirected_to anchors_url
  end
end
