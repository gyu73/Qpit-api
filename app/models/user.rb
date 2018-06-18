class User < ApplicationRecord
  has_one :hint, dependent: :destroy
  has_one :secret_hint, dependent: :destroy
end
