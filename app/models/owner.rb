class Owner < ApplicationRecord
    before_save :normalize_phone_number

    validates :first_name, :last_name, :email, presence: true, length: {maximum: 255}

    validates :email, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

    def normalize_phone_number
        if phone.present?
            phone.gsub!(/^1/, '')
            phone.gsub!(/[()-.]/, '')
        end
    end
    
end
