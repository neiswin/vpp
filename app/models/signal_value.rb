class SignalValue < ApplicationRecord
  has_many :realtimes, dependent: :destroy
end
