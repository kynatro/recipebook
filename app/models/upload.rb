class Upload < ActiveRecord::Base
  belongs_to :recipe, inverse_of: :uploads
  has_attached_file :local_image,
                    path: ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
                    url:  "/system/:attachment/:id/:style/:basename.:extension"

  has_attached_file :image,
                      styles: {
                        thumb: '64x64#',
                        small: '200x200#',
                        medium: '600x600>',
                        big: '1000x1000>'
                      },
                      convert_options: {all: '-strip'},
                      storage: :s3,
                      s3_credentials: {
                        bucket: ENV['AWS_BUCKET'],
                        access_key_id: ENV['AWS_ACCESS_KEY'],
                        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
                      },
                      s3_headers: {
                        'Expires' => 1.year.from_now.httpdate,
                        'Content-Disposition' => 'attachment'
                      },
                      bucket: ENV['AWS_BUCKET'],
                      url: ":s3_domain_url",
                      path: "images/:id/:style/:filename"

  after_save :queue_upload_to_s3

  validates_attachment :local_image,
                       presence: true,
                       content_type: { content_type: /\Aimage\/.*\Z/ },
                       size: { in: 0..4.megabytes }
  validates_attachment :image,
                       content_type: { content_type: /\Aimage\/.*\Z/ }

  validates :recipe, presence: true

  def queue_upload_to_s3
    Delayed::Job.enqueue UploadJob.new(id) if local_image? && local_image_updated_at_changed?
  end

  def upload_to_s3
    self.image = Paperclip.io_adapters.for local_image
    save!
  end
end
