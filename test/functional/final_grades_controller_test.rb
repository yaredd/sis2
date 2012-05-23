require 'test_helper'

class FinalGradesControllerTest < ActionController::TestCase
  setup do
    @final_grade = final_grades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:final_grades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create final_grade" do
    assert_difference('FinalGrade.count') do
      post :create, final_grade: @final_grade.attributes
    end

    assert_redirected_to final_grade_path(assigns(:final_grade))
  end

  test "should show final_grade" do
    get :show, id: @final_grade.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @final_grade.to_param
    assert_response :success
  end

  test "should update final_grade" do
    put :update, id: @final_grade.to_param, final_grade: @final_grade.attributes
    assert_redirected_to final_grade_path(assigns(:final_grade))
  end

  test "should destroy final_grade" do
    assert_difference('FinalGrade.count', -1) do
      delete :destroy, id: @final_grade.to_param
    end

    assert_redirected_to final_grades_path
  end
end
