require 'test_helper'

class HanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hank = hanks(:one)
  end

  test "should get index" do
    get hanks_url
    assert_response :success
  end

  test "should get new" do
    get new_hank_url
    assert_response :success
  end

  test "should create hank" do
    assert_difference('Hank.count') do
      post hanks_url, params: { hank: { cod_anchor: @hank.cod_anchor, cod_dmc: @hank.cod_dmc, cod_maxi: @hank.cod_maxi, name: @hank.name } }
    end

    assert_redirected_to hank_url(Hank.last)
  end

  test "should show hank" do
    get hank_url(@hank)
    assert_response :success
  end

  test "should get edit" do
    get edit_hank_url(@hank)
    assert_response :success
  end

  test "should update hank" do
    patch hank_url(@hank), params: { hank: { cod_anchor: @hank.cod_anchor, cod_dmc: @hank.cod_dmc, cod_maxi: @hank.cod_maxi, name: @hank.name } }
    assert_redirected_to hank_url(@hank)
  end

  test "should destroy hank" do
    assert_difference('Hank.count', -1) do
      delete hank_url(@hank)
    end

    assert_redirected_to hanks_url
  end
end
