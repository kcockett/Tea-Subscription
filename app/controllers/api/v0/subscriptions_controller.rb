class Api::V0::SubscriptionsController < ApplicationController
  def index
    if customer = Customer.find(params[:customer_id])
      subscriptions = customer.subscriptions
      render json: subscriptions, status: :ok
    else
      # Future sad path logic, customer not found
    end
  end
  
  def create
    subscription = Subscription.new(subscription_params)

    if subscription.save
      render json: subscription, status: :created
    else
      # Future sad path features
    end
  end

  def destroy
    if subscription = Subscription.find(removal_params[:id])
      if customer = Customer.find_by(email: removal_params[:customer_email])
        if subscription.update(status: "cancelled")
          render json: { message: 'Subscription successfully cancelled' }, status: :ok
        else
          # Future sad path logic... render json: { error: 'Failed to update the subscription status' }, status: :unprocessable_entity
        end
      else
        # Future sad path logic... render json: { error: 'Cannot be processed' }, status: :422
      end
    else
      # Future sad path logic
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :customer_id, :tea_id, :status, :frequency_months)
  end

  def removal_params
    params.require(:subscription).permit(:id, :customer_email)
  end
end