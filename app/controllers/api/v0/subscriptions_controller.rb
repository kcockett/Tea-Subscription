class Api::V0::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(subscription_params)

    if subscription.save
      render json: subscription, status: :created
    else
      # Future sad path features
    end
  end

  def destroy
    subscription = Subscription.find(removal_params[:id])
    if subscription.customer_id == removal_params[:customer_id].to_i
      if subscription.update(status: "cancelled")
        render json: { message: 'Subscription successfully cancelled' }, status: :ok
      else
        # Future sad path logic... render json: { error: 'Failed to update the subscription status' }, status: :unprocessable_entity
      end
    else
      # Future sad path logic... render json: { error: 'Cannot be processed' }, status: :422
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :customer_id, :tea_id, :status, :frequency_months)
  end

  def removal_params
    params.require(:subscription).permit(:id, :customer_id)
  end
end