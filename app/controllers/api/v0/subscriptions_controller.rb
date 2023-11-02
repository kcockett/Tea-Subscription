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

  def update
    if removal_params[:status] == "cancel"
      if subscription = Subscription.find(params[:id])
        if customer = Customer.find(params[:customer_id])
          if subscription.update(status: "cancelled")
            render json: { message: 'Subscription successfully cancelled' }, status: :ok
          else
            # Future sad path logic... subscription cannot update: render json: { error: 'Failed to update the subscription status' }, status: :unprocessable_entity
          end
        else
          # Future sad path logic... customer not found: render json: { error: 'Cannot be processed' }, status: :422
        end
      else
        # Future sad path logic... subscription not found: render json: { error: 'Cannot be processed' }, status: :422
      end
    else
      #Future option path, such as reactivating an cancelled subscription
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