require 'test_helper'

class OrdemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ordems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ordem" do
    assert_difference('Ordem.count') do
      post :create, :ordem => { }
    end

    assert_redirected_to ordem_path(assigns(:ordem))
  end

  test "should show ordem" do
    get :show, :id => ordems(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ordems(:one).to_param
    assert_response :success
  end

  test "should update ordem" do
    put :update, :id => ordems(:one).to_param, :ordem => { }
    assert_redirected_to ordem_path(assigns(:ordem))
  end

  test "should destroy ordem" do
    assert_difference('Ordem.count', -1) do
      delete :destroy, :id => ordems(:one).to_param
    end

    assert_redirected_to ordems_path
  end
end
