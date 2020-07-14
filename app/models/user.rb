class User < ApplicationRecord
    
    before_save { self.email = email.downcase }
    has_many :products, dependent: :destroy
    # has_many :comments, dependent: :destroy
    validates :username, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { maximum: 105 },
                        format: { with: VALID_EMAIL_REGEX }
    has_secure_password
    acts_as_voter
    has_many :comments

def comment_created
self.number_of_comments = number_of_comments + 1
save
number_of_comments
end

end
