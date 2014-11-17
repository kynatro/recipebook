class Ingredient < ActiveRecord::Base
  validates :label, presence: true
  
  has_many :quantities, inverse_of: :ingredient
  has_many :recipes, through: :quantities

  before_save :sanitize_label

  private
    def sanitize_label
      self.label = strip_tags(self.label)
    end
end
