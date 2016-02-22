# encoding: utf-8

class CoverUploader < CarrierWave::Uploader::Base

    include CarrierWave::MiniMagick
    include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => ['post_picture']

  process :resize_to_fit=> [800,800]
  
  version :standard do
    process :eager => true
    process :resize_to_fill => [100, 150, :north]
  end
    version :large do
    resize_to_limit(600, 600)
  end
  version :thumb do
    #resize_to_fill(100, 100)
     process :resize_to_fill=> [100,100]
  end

#    def public_id
 #   return model.name
 # end  

end
