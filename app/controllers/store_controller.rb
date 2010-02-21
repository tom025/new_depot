class StoreController < ApplicationController
  before_filter :find_cart, :except => :empty_cart
  def index
    @products = Product.find_products_for_sale
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
    flash[:counter] = "Your visit counter is #{session[:counter]}"
  end

  def add_to_cart
    product = Product.find(params[:id])
    @current_item = @cart.add_product(product)
    session[:counter] = 0 
      respond_to do |format|
        format.js if request.xhr?
        format.html {redirect_to_index}
      end
  rescue ActiveRecord::RecordNotFound
    logger.error("Attemp to access invalid product #{params[:id]}")
    @cart = find_cart
    redirect_to_index("Invalid Product")
  end

  def empty_cart
    session[:cart] = nil
      respond_to do |format|
        format.js if request.xhr?
        format.html {redirect_to_index}
      end
  end

  def checkout
    if @cart.items.empty? or @cart.nil?
      redirect_to_index "Your Cart is Empty"
    else
      @order = Order.new
    end
  end

  def save_order
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    if @order.save
      session[:cart] = nil
      redirect_to_index("Thank You for Your Oder")
    else
      render :action => 'checkout'
    end
  end
  
  private

  def find_cart
    session[:cart] ||= Cart.new
  end

  def redirect_to_index(msg=nil)
    flash[:notice] = msg if msg
    redirect_to :action => 'index'
  end

  protected
  def authorize
  end
end
