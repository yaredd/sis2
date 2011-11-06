require 'test_helper'

class SchoolSetupsControllerTest < ActionController::TestCase
  setup do
    @school_setup = school_setups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_setups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_setup" do
    assert_difference('SchoolSetup.count') do
      post :create, school_setup: @school_setup.attributes
    end

    assert_redirected_to school_setup_path(assigns(:school_setup))
  end

  test "should show school_setup" do
    get :show, id: @school_setup.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_setup.to_param
    assert_response :success
  end

  test "should update school_setup" do
    put :update, id: @school_setup.to_param, school_setup: @school_setup.attributes
    assert_redirected_to school_setup_path(assigns(:school_setup))
  end

  test "should destroy school_setup" do
    assert_difference('SchoolSetup.count', -1) do
      delete :destroy, id: @school_setup.to_param
    end

    assert_redirected_to school_setups_path
  end
end
