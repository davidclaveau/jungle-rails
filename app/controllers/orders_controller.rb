class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])

    line_items = LineItem.where(order_id: params[:id])

    @products = LineItem.select(:image, :name, :description, :quantity, :item_price_cents, :total_price_cents, :product_id).joins(:product, :order).where(order_id: params[:id])

    # @products = Product.select(Arel.star).where(LineItem.arel_table[:order_id].eq(params[:id])).joins(
    #   Product.arel_table.join(LineItem.arel_table).on(
    #     LineItem.arel_table[:product_id].eq(Product.arel_table[:id])
    #   ).join_sources
    # ).joins(
    #   Product.arel_table.join(Order.arel_table).on(
    #     LineItem.arel_table[:order_id].eq(Order.arel_table[:id])
    #   ).join_sources
    # )

    # SELECT *
    #   FROM products
    #   JOIN line_items ON line_items.product_id = products.id
    #   JOIN orders ON line_items.order_id = orders.id
    #  WHERE line_items.order_id = 1;

  end

  def create
    charge = perform_stripe_charge
    order  = create_order(charge)

    if order.valid?
      empty_cart!
      redirect_to order, notice: 'Your Order has been placed.'
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "Khurram Virani's Jungle Order",
      currency:    'cad'
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
    order.save!
    order
  end

end
