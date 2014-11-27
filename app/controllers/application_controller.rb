# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def bad_request
    render nothing: true, status: 400
  end

  def created(image_path)
    render json: { image: image_path }, status: 201
  end

  def internal_error
    render nothing: true, status: 500
  end

  def missing?(*fields)
    fields.any? { |field| params[field].nil? || params[field].empty? }
  end
end
