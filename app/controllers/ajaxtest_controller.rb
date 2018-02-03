class AjaxtestController < ApplicationController
  def index
  end

  def create
    render json: { hey: 123 }
  end
end
