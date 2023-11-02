class Api::V0::TeasController < ApplicationController
  def index
    teas = Tea.all

    render json: teas, status: :ok
  end
end