require 'test_helper'

class ApplicationsControllerTest < ActionController::TestCase
  setup do
    @application = applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create application" do
    assert_difference('Application.count') do
      post :create, application: { constraint: @application.constraint, consumer: @application.consumer, consumption: @application.consumption, contracted: @application.contracted, criticality: @application.criticality, customer_id: @application.customer_id, customization: @application.customization, inhouse: @application.inhouse, integration: @application.integration, name: @application.name, provider: @application.provider, regulatory: @application.regulatory, sensitivity: @application.sensitivity, servers: @application.servers, style: @application.style, tiers: @application.tiers, transport: @application.transport }
    end

    assert_redirected_to application_path(assigns(:application))
  end

  test "should show application" do
    get :show, id: @application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @application
    assert_response :success
  end

  test "should update application" do
    patch :update, id: @application, application: { constraint: @application.constraint, consumer: @application.consumer, consumption: @application.consumption, contracted: @application.contracted, criticality: @application.criticality, customer_id: @application.customer_id, customization: @application.customization, inhouse: @application.inhouse, integration: @application.integration, name: @application.name, provider: @application.provider, regulatory: @application.regulatory, sensitivity: @application.sensitivity, servers: @application.servers, style: @application.style, tiers: @application.tiers, transport: @application.transport }
    assert_redirected_to application_path(assigns(:application))
  end

  test "should destroy application" do
    assert_difference('Application.count', -1) do
      delete :destroy, id: @application
    end

    assert_redirected_to applications_path
  end
end
