class News < ActiveRecord::Base
  attr_accessible :user_id, :close_at, :content, :publish_at, :title
  belongs_to :admin, :foreign_key => 'user_id'
  belongs_to :user, :foreign_key => 'user_id'

  scope :letest, -> { where("publish_at IS NOT NULL AND (close_at IS NULL OR close_at >= ?)", DateTime.now).order(publish_at: :desc).order(created_at: :desc) }
end
