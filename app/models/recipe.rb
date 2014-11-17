include ActionView::Helpers::SanitizeHelper

class Recipe < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :instructions, presence: true

  has_many :quantities, inverse_of: :recipe
  has_many :ingredients, through: :quantities
  has_many :uploads, inverse_of: :recipe

  accepts_nested_attributes_for :quantities, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :uploads, reject_if: :all_blank, allow_destroy: true

  before_save :santize_properties

  def santize_properties
    [:title, :description, :instructions].each{|prop| self.send("#{prop}=", strip_tags(self.send("#{prop}")))}
  end
end
