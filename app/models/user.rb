class User < ApplicationRecord
    has_one :address, dependent: :destroy
end
