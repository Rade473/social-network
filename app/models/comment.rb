class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_create_commit -> { broadcast_prepend_to "comments", partial: "comments/comment", locals: { comment: self }, target: "comments_for_post_#{self.post.id}" }
end
