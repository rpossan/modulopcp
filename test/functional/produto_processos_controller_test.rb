require 'test_helper'

class ProdutoProcessosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:produto_processos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create produto_processo" do
    assert_difference('ProdutoProcesso.count') do
      post :create, :produto_processo => { }
    end

    assert_redirected_to produto_processo_path(assigns(:produto_processo))
  end

  test "should show produto_processo" do
    get :show, :id => produto_processos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => produto_processos(:one).to_param
    assert_response :success
  end

  test "should update produto_processo" do
    put :update, :id => produto_processos(:one).to_param, :produto_processo => { }
    assert_redirected_to produto_processo_path(assigns(:produto_processo))
  end

  test "should destroy produto_processo" do
    assert_difference('ProdutoProcesso.count', -1) do
      delete :destroy, :id => produto_processos(:one).to_param
    end

    assert_redirected_to produto_processos_path
  end
end
