require 'test_helper'

class RegulatoriesControllerTest < ActionController::TestCase
  setup do
    @regulatory = regulatories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regulatories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create regulatory" do
    assert_difference('Regulatory.count') do
      post :create, regulatory: { name: @regulatory.name, share: @regulatory.share }
    end

    assert_redirected_to regulatory_path(assigns(:regulatory))
  end

  test "should show regulatory" do
    get :show, id: @regulatory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @regulatory
    assert_response :success
  end

  test "should update regulatory" do
    patch :update, id: @regulatory, regulatory: { name: @regulatory.name, share: @regulatory.share }
    assert_redirected_to regulatory_path(assigns(:regulatory))
  end

  test "should destroy regulatory" do
    assert_difference('Regulatory.count', -1) do
      delete :destroy, id: @regulatory
    end

    assert_redirected_to regulatories_path
  end
end
