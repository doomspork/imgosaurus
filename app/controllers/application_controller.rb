# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def authorize!
    unauthorized unless token && user
  end

  def unauthorized
    render nothing: true, status: 401
  end

  def bad_request
    render nothing: true, status: 400
  end

  def created(image_path)
    render json: { image: image_path }, status: 201
  end

  def token
    request.env['HTTP_IMGOSAURUS_TOKEN']
  end

  def user
    @user ||= User.where(token: token).first
  end

  def missing?(*fields)
    fields.any? { |field| params[field].nil? || params[field].empty? }
  end
end
