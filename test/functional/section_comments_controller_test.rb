require 'test_helper'

class SectionCommentsControllerTest < ActionController::TestCase
  setup do
    @section_comment = section_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:section_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create section_comment" do
    assert_difference('SectionComment.count') do
      post :create, section_comment: @section_comment.attributes
    end

    assert_redirected_to section_comment_path(assigns(:section_comment))
  end

  test "should show section_comment" do
    get :show, id: @section_comment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @section_comment.to_param
    assert_response :success
  end

  test "should update section_comment" do
    put :update, id: @section_comment.to_param, section_comment: @section_comment.attributes
    assert_redirected_to section_comment_path(assigns(:section_comment))
  end

  test "should destroy section_comment" do
    assert_difference('SectionComment.count', -1) do
      delete :destroy, id: @section_comment.to_param
    end

    assert_redirected_to section_comments_path
  end
end
