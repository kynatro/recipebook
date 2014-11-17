class Upload < ActiveRecord::Base
  belongs_to :recipe, inverse_of: :uploads
  has_attached_file :image,
                     styles: {
                       thumb: '64x64#',
                       small: '200x200#',
                       medium: '600x600>',
                       big: '1000x1000>'
                     }

  validates_attachment :image,
                       presence: true,
                       content_type: { content_type: /\Aimage\/.*\Z/ },
                       size: { in: 0..4.megabytes }
  validates :recipe, presence: true
end
