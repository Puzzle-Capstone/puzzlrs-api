class Api::V1::RequestsController < ApplicationController
  def create
    request = Request.create!(user_id: request_params[:user_id], puzzle_id: request_params[:puzzle_id])

    @puzzle = request.puzzle

    if request.save
      RequestNotificationMailer.with(user: @puzzle.user, puzzle: @puzzle).request_notification_email.deliver_now
    end

    render json: RequestSerializer.new(request), response: 201
  end

  def update
    request = Request.find(params[:id])
    request.update(status: params[:status])

    @user = request.user
    @puzzle = request.puzzle

    if params[:status] == 'accepted'
      AcceptanceMailer.with(user: @user, puzzle: @puzzle).acceptance_email.deliver_now
      request = request.destroy
      @puzzle.destroy
    elsif params[:status] == 'declined'
      RejectionMailer.with(user: @user, puzzle: @puzzle).rejection_email.deliver_now
      request = request.destroy
    end

    render json: RequestSerializer.new(request)
  end

  def destroy
    request = Request.find(params[:id])

    request.destroy

    render json: RequestSerializer.new(request)
  end

  private

  def request_params
    params.permit(:user_id, :puzzle_id)
  end
end
