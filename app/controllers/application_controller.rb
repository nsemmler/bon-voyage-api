class ApplicationController < ActionController::API
  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def render_resource (resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error (resource)
    render json: {
      errors: [
        { status: '400', title: 'Bad Request', detail: resource.errors }
      ]
    }, status: :bad_request
  end

  private

  def record_not_found
    render json: { error: 'Invalid User ID' }, status: 400
  end
end
