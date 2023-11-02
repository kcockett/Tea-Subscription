class Api::V0::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find_by(id: params[:customer_id])
    if customer
      subscriptions = customer.subscriptions
      render json: subscriptions, status: :ok
    else
      render json: { error: 'Unable to process this request' }, status: :unprocessable_entity
    end
  end
  
  def create
    if subscription_params[:customer_id].nil? || subscription_params[:tea_id].nil?
      render json: { error: 'Unable to process this request' }, status: :unprocessable_entity
      return
    end

    customer = Customer.find(subscription_params[:customer_id])
    tea = Tea.find(subscription_params[:tea_id])
    found_subscription = Subscription.find_by(customer_id: subscription_params[:customer_id], tea_id: subscription_params[:tea_id])
  
    if found_subscription
      render json: { error: 'Unable to process this request' }, status: :unprocessable_entity
    else
      subscription = Subscription.new(subscription_params)
  
      if subscription.save
        render json: subscription, status: :created
      else
        render json: { error: 'Unable to process this request' }, status: :unprocessable_entity
      end
    end
  end
  

  def update
    customer = Customer.find_by(id: params[:customer_id])
    subscription = Subscription.find_by(id: params[:id])
  
    if customer && subscription
      if removal_params[:status] == "cancel"
        subscription.update(status: "canceled")
        render json: { message: 'Subscription successfully canceled' }, status: :ok
      else
        render json: { error: 'Unable to process this request' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Unable to process this request' }, status: :unprocessable_entity
    end
  end
  

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :customer_id, :tea_id, :status, :frequency_months)
  end

  def removal_params
    params.require(:subscription).permit(:status)
  end

end