require 'test_helper'

class YesnosControllerTest < ActionController::TestCase
  setup do
    @yesno = yesnos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yesnos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yesno" do
    assert_difference('Yesno.count') do
      post :create, yesno: { name: @yesno.name, share: @yesno.share }
    end

    assert_redirected_to yesno_path(assigns(:yesno))
  end

  test "should show yesno" do
    get :show, id: @yesno
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yesno
    assert_response :success
  end

  test "should update yesno" do
    patch :update, id: @yesno, yesno: { name: @yesno.name, share: @yesno.share }
    assert_redirected_to yesno_path(assigns(:yesno))
  end

  test "should destroy yesno" do
    assert_difference('Yesno.count', -1) do
      delete :destroy, id: @yesno
    end

    assert_redirected_to yesnos_path
  end
end
