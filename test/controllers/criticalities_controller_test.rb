require 'test_helper'

class CriticalitiesControllerTest < ActionController::TestCase
  setup do
    @criticality = criticalities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:criticalities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create criticality" do
    assert_difference('Criticality.count') do
      post :create, criticality: { name: @criticality.name, share: @criticality.share }
    end

    assert_redirected_to criticality_path(assigns(:criticality))
  end

  test "should show criticality" do
    get :show, id: @criticality
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @criticality
    assert_response :success
  end

  test "should update criticality" do
    patch :update, id: @criticality, criticality: { name: @criticality.name, share: @criticality.share }
    assert_redirected_to criticality_path(assigns(:criticality))
  end

  test "should destroy criticality" do
    assert_difference('Criticality.count', -1) do
      delete :destroy, id: @criticality
    end

    assert_redirected_to criticalities_path
  end
end
