# -*- encoding : utf-8 -*-
module Pipeline
  extend self

  # Public: Given a path to an image and a set of transformations do something
  #
  # path - String, path to a local or remote image
  # transformation - Hash, a collection of transformations
  # user_id - Interger of user submitting image
  #
  # Returns a String representing the final processed image
  def process(path, transformations, user_id)
    file = upload_file(path, (id = SecureRandom.uuid))
    file.save
  end

  private

  # Private:
  #
  # Returns a Fog Directory
  def upload_file(file, destination)
    body = IO.open(file).read
    image_cache_dir.create(key: destination, body: body, public: true)
  end

  # .freeze is a ruby 2.1 perfm++
  IMAGE_CACHE_BUCKET = 'raw_images'.freeze

  def image_cache_dir
    @image_cache_dir ||=
      if dir_exists?(IMAGE_CACHE_BUCKET)
        storage.directories.new(key: IMAGE_CACHE_BUCKET)
      else
        storage.directories.create(key: IMAGE_CACHE_BUCKET, public: true)
      end
  end

  # Private: Determine whether a directory exists or not
  #
  # name - The directory name
  #
  # Returns a boolean
  def dir_exists?(name)
    # Does it exist?
  end

  # Private: Get an instance to the Fog Storage object
  #
  # Returns a Fog::Storage object based on the Rails env
  def storage
    @storage ||= Fog::Storage.new(storage_config)
  end

  # Private: Return the current environments storage configuration fron
  # config/storage.yml
  #
  # Returns a Hash
  def storage_config
    YAML.load_file(Rails.root.join('config', 'storage.yml'))[Rails.env]
  end

end
