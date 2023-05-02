class Payment < ApplicationRecord
  has_one :ticket, dependent: :nullify
end
