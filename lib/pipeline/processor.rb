# -*- encoding : utf-8 -*-
module Pipeline
  module Processor

    def process(original, changes)
      changes.each_with_object(original) { |(action, args), image| image.send(action, *args) }
    end

  end
end
