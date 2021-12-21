class Blog < ApplicationRecord
  validates_presence_of :name
  belongs_to :user
  has_many :articles, dependent: :destroy

  delegate :name, to: :user, prefix: :user
end
