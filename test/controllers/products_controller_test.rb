require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { color: @product.color, inward_date: @product.inward_date, name: @product.name, price: @product.price, type: @product.type } }
    end

    assert_redirected_to product_url(Product.last)
  end

end
