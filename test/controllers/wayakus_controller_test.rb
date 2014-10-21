require 'test_helper'

class WayakusControllerTest < ActionController::TestCase
  setup do
    @wayaku = wayakus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wayakus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wayaku" do
    assert_difference('Wayaku.count') do
      post :create, wayaku: { answer_of_user: @wayaku.answer_of_user, post_id: @wayaku.post_id, post_type: @wayaku.post_type, questionBody: @wayaku.questionBody, selected_category: @wayaku.selected_category }
    end

    assert_redirected_to wayaku_path(assigns(:wayaku))
  end

  test "should show wayaku" do
    get :show, id: @wayaku
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wayaku
    assert_response :success
  end

  test "should update wayaku" do
    patch :update, id: @wayaku, wayaku: { answer_of_user: @wayaku.answer_of_user, post_id: @wayaku.post_id, post_type: @wayaku.post_type, questionBody: @wayaku.questionBody, selected_category: @wayaku.selected_category }
    assert_redirected_to wayaku_path(assigns(:wayaku))
  end

  test "should destroy wayaku" do
    assert_difference('Wayaku.count', -1) do
      delete :destroy, id: @wayaku
    end

    assert_redirected_to wayakus_path
  end
end
