class Question < ApplicationRecord
  belongs_to :mapping
  belongs_to :role
end
