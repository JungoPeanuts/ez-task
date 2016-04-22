class Post < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    validates :content, presence: true, length: {maximum: 150} #cap space for messages
    default_scope -> {order(created_at: :desc) } #newest posts first
end
