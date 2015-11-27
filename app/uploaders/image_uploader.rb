# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def public_id
    if model.try(:title)
      return model.title.parameterize
    else
      return model.object_id
    end
  end
end
