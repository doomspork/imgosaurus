# -*- encoding : utf-8 -*-
module Pipeline
  module Recorder

    def record(image, request, user_id)
      attributes = {
        original_filepath: request[:image],
        transformations:   request[:transformations],
        user_id:           user_id
      }.merge(image_meta(image))

      Image.create(attributes)
    end

    private

    CAPTURED_ATTRIBUTES = %i(dimensions mime_type resolution signature size)

    def image_meta(image)
      CAPTURED_ATTRIBUTES.each_with_object({}) { |key, memo| memo[key] = image.send(key) }
    end

  end
end
