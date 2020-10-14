require './lib/shoppingcart'

class ShoppingCart
  attr_reader :name,
              :capacity,
              :products


  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
    @details = nil
  end

  def add_product(product)
    @products << product
  end

  def details
    @details = {
      name: @name,
      capacity: @capacity
    }
  end

  def is_full?
    (@products.sum do |product|
      product.quantity
    end) > @capacity
  end

  def products_by_category(category)
    @products.find_all do |product|
      product.category == category
    end
  end

  def percentage_occupied
    ((@products.sum do |product|
      product.quantity
    end).to_f / @capacity) * 100
  end

  def sorted_products_by_quantity
    @products.sort_by do |product|
      product.quantity
    end
  end

end
