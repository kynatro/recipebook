include ActionView::Helpers::SanitizeHelper

class Recipe < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :instructions, presence: true

  has_many :quantities
  has_many :ingredients, through: :quantities

  before_save :santize_properties

  def santize_properties
    [:title, :description, :instructions].each{|prop| self.send("#{prop}=", strip_tags(self.send("#{prop}")))}
  end
end
