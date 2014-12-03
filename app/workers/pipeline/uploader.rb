# -*- encoding : utf-8 -*-
module Pipeline
  class Uploader
    include Sidekiq::Worker

    def perform(source_path)
      # TODO
    end

    private

    def filename(path)
      # TODO
    end

  end
end