# app/uploaders/post_image_uploader.rb
class PostImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  process :store_aspect_ratio

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def asset_host
    "http://81.177.160.46 "
  end
  # def asset_host
  #   "http://localhost:3000"
  # end

  private

  def store_aspect_ratio
    manipulate! do |img|
      model.aspect_ratio = closest_aspect_ratio(img.width, img.height)
      img
    end
  end

  def closest_aspect_ratio(width, height)
    original_ratio = width.to_f / height
    target_ratios = {
      "3:4" => 3.0/4,
      "1:1" => 1.0,
      "5:4" => 5.0/4,
      "3:2" => 3.0/2
    }
    target_ratios.min_by { |_, ratio| (original_ratio - ratio).abs }.first
  end
end
