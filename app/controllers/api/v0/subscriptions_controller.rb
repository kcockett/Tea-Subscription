class Api::V0::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(subscription_params)

    if subscription.save
      render json: subscription, status: :created
    else
      # Future sad path features
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :customer_id, :tea_id, :status, :frequency_months)
  end
end