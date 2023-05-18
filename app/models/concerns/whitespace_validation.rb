module WhitespaceValidation
  extend ActiveSupport::Concern

  included do
    before_validation :strip_whitespace, :normalize_whitespace
  end

  def strip_whitespace
    attributes.each do |attr, value|
      self[attr] = value.strip if value.respond_to?(:strip)
    end
  end

  def normalize_whitespace
    attributes.each do |attr, value|
      self[attr] = value.squeeze(' ') if value.respond_to?(:squeeze)
    end
  end
end
