class Article < ApplicationRecord
  validates_presence_of :title, :content
  belongs_to :blog
  belongs_to :user

  enum state: { hidden: 0, published: 1 }
  scope :published, -> { where(state: self.states[:published]) }
end
