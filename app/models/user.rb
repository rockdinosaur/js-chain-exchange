class User < ApplicationRecord
  has_one :wallet
  has_secure_password
end
