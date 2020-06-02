class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  # 画像の縦横比を維持したまま、widthを最大200px、heightを最大324pxとする
  process resize_to_fit: [200, 324]

  # 投稿された画像はuploadの中に保存される
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
