class User < ApplicationRecord
has_many :blogs
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
