require 'test_helper'

class InterimGradesControllerTest < ActionController::TestCase
  setup do
    @interim_grade = interim_grades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interim_grades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interim_grade" do
    assert_difference('InterimGrade.count') do
      post :create, interim_grade: @interim_grade.attributes
    end

    assert_redirected_to interim_grade_path(assigns(:interim_grade))
  end

  test "should show interim_grade" do
    get :show, id: @interim_grade.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interim_grade.to_param
    assert_response :success
  end

  test "should update interim_grade" do
    put :update, id: @interim_grade.to_param, interim_grade: @interim_grade.attributes
    assert_redirected_to interim_grade_path(assigns(:interim_grade))
  end

  test "should destroy interim_grade" do
    assert_difference('InterimGrade.count', -1) do
      delete :destroy, id: @interim_grade.to_param
    end

    assert_redirected_to interim_grades_path
  end
end
