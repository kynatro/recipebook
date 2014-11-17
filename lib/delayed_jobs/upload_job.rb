class UploadJob < Struct.new(:upload_id)
  def perform
    upload = Upload.find upload_id
    upload.upload_to_s3
    upload.local_image.destroy
  end
end
