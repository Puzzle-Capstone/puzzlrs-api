module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { message: e.message, errors: 'Bad Request' }, status: 400
    end
  end
end
