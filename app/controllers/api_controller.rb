class ApiController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def render_result(result, success_status = :ok, error_status = :unauthorized)
    return render json: result.output, status: success_status if result.success?

    render_error(result.errors, error_status)
  end

  private

  def record_not_found(error)
    render_error(error, :not_found)
  end

  def render_error(error, status)
    render json: { errors: [error] }, status: status
  end
end
