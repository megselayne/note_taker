class User < ApplicationRecord
    has_many :notes

    validates :email, presence: true, uniqueness: true
    has_secure_password
    has_secure_token :auth_token

    def invalidate_token
        self.update(auth_token: nil)
    end

    def self.validate_login(username, password)
        user = find_by(username: username)
        if user && user.authenticate(password)
            user
        end
    end
end
