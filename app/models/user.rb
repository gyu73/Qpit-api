class User < ApplicationRecord
  has_one :hint
  has_one :secret_hint
end
