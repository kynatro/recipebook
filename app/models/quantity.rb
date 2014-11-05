class Quantity < ActiveRecord::Base
  validates :amount, presence: true

  belongs_to :recipe
  belongs_to :ingredient

  before_save :sanitize_amount

  private
    def sanitize_amount
      self.amount = strip_tags(self.amount)
    end
end
