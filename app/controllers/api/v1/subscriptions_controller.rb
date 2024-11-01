class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    render json: subscriptions
  end
  def create
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.new(subscription_params)

    if subscription.save
      render json: subscription, status: 200
    else
      render json: { error: "Failed to Subscribe" }, status: 400
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    if subscription.update(status: :disabled)
      render json: subscription, status: 200
    else
      render json: { error: "Failed to cancel subscription" }, status: 400
    end
  end

  def subscription_params
    params.require(:subscription).permit(:tea_id, :sub_name, :price, :frequency)
  end
end