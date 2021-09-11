class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_one_attached :image
    validates :title, presence:true, length:{minimum:6, maximum:20}
    validates :description, presence:true, length:{maximum:150}
end