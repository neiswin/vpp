class Realtime < ApplicationRecord
  after_create_commit -> { broadcast_prepend_to "realtimes", partial: "realtimes/value", locals: { name: self }, target: "realtimes" }
  # belongs_to :signal_value, optional: true
end
