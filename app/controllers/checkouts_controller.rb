class CheckoutsController < ApplicationController
  def create
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        :name => params[:name],
        :amount => params[:price].to_i,
        :currency => "usd",
        :quantity => 1,
    }],
      mode: 'payment',
      success_url: root_url,
      cancel_url: root_url,
    })
    redirect_to @session.url, allow_other_host: true

   
  end
end
