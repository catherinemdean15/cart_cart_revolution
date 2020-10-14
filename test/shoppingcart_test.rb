require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shoppingcart'

class ShoppingCartTest < Minitest::Test

  def setup
    @cart = ShoppingCart.new("King Soopers", "30items")
    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
    @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    @product4 = Product.new(:produce, 'apples', 0.99, '20')
  end

  def test_it_exists
    assert_instance_of ShoppingCart, @cart
  end

  def test_it_has_a_name
    assert_equal 'King Soopers', @cart.name
  end

  def test_it_has_capacity
    assert_equal 30, @cart.capacity
  end

  def test_it_has_products
    assert_equal [], @cart.products
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    assert_equal [@product1, @product2], @cart.products
  end

  # def test_it_shows_details
  #   assert_equal details, @cart.details
  # end

  def test_if_cart_is_full
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    refute @cart.is_full?
    @cart.add_product(@product4)
    assert @cart.is_full?
  end

  def test_it_shows_products_by_category
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    @cart.add_product(@product4)
    assert_equal [@product1, @product3], @cart.products_by_category(:paper)
  end

  def test_if_it_shows_percentage_occupied
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    assert_equal 43.33, @cart.percentage_occupied
  end

  def test_if_it_sorts_products_by_quantity
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    @cart.add_product(@product4)
    assert_equal [@product4,@product1, @product2, @product3], @cart.sorted_products_by_quantity
  end 

end
