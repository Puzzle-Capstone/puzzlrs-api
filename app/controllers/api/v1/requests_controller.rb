class Api::V1::RequestsController < ApplicationController
  def create
    request = Request.new(request_params[:user_id], request_params[:puzzle_id])
    render json: RequestSerializer.new(request), status: 201
  end

  def update
    request = Requests.find(params[:id])
    request.update(status: params[:status])
    render json: RequestSerializer.new(request)
  end

  def destroy
    request = Requests.find(params[:id])

    request.destroy
  end

  private

  def request_params
    params.permit(:user_id, :puzzle_id)
  end
end
