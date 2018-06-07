class Hint < ApplicationRecord
	belongs_to :user
    has_one :secret_hint
end
