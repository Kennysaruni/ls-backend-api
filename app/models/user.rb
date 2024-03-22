class User < ApplicationRecord
    has_many :links
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}
    validates :email, uniqueness: {case_sensitive: false}
end
