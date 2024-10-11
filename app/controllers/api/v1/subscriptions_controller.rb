class Api::V1::SubscriptionController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    render json: subscriptions
  end
  def create
    customer = Customer.find(params[:customer_id])
    tea = Tea.find(params[:tea_id])
    subscription = customer.subscriptions.create(tea: tea, title: tea.title, price: params[:price], frequency: params[:frequency])

    if subscription.save
      render json: subscription, status: 200
    else
      render json: { error: "Failed to Subscribe" }, status: 400
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    if subscription.update(status: :cancelled)
      render json: subscription, status: 200
    else
      render json: { error: "Failed to cancel subscription" }, status: 400
    end
  end
end