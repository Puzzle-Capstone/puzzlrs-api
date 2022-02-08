class Api::V1::RequestsController < ApplicationController
  def create
    request = Request.create!(user_id: request_params[:user_id], puzzle_id: request_params[:puzzle_id])
    render json: RequestSerializer.new(request), response: 201
  end

  def update
    request = Request.find(params[:id])
    request.update(status: params[:status])
    render json: RequestSerializer.new(request)
  end

  def destroy
    request = Request.find(params[:id])

    request.destroy
  end

  private

  def request_params
    params.permit(:user_id, :puzzle_id)
  end
end
