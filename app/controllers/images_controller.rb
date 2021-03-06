# -*- encoding : utf-8 -*-
class ImagesController < ApplicationController
  before_action :authorize!, :validate_params

  def create
    final_image = Pipeline.process(image, transforms)
    render_response(final_image)
  end

  protected

  def validate_params
    bad_request if missing?(*%i(image transformations))
  end

  def render_response(image)
    if image then created(image) else bad_request end
  end

  def image
    @image ||= params[:image]
  end

  def transforms
    @transforms ||= params[:transformations]
  end

end
