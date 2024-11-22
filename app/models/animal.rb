class Animal < ApplicationRecord
  after_save :domesticate

  def domesticate
    TameJob.perform_later
    raise ActiveRecord::Rollback, "Too Wild"
  end
end
