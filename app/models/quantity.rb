class Quantity < ActiveRecord::Base
  validates :amount, presence: true
  validates :ingredient, presence: true

  belongs_to :recipe, inverse_of: :quantities
  belongs_to :ingredient, inverse_of: :quantities

  accepts_nested_attributes_for :ingredient, reject_if: :all_blank

  before_save :sanitize_amount

  def ingredient_attributes=(ingredient_attributes)
    unless self.amount.blank?
      ingredient = Ingredient.find_or_create_by(label: ingredient_attributes[:label])
      self.ingredient = ingredient
    end
  end

  private
    def sanitize_amount
      self.amount = strip_tags(self.amount)
    end
end
