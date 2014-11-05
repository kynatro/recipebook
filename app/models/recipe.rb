class Recipe < ActiveRecord::Base
  validates :title, presence: true

  has_many :quantities
  has_many :ingredients, through: :quantities

  before_save :sanitize_title

  private
    def sanitize_title
      self.title = strip_tags(self.title)
    end
end
