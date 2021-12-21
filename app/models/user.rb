class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :name
  has_many :blogs, dependent: :destroy
  has_many :articles, dependent: :destroy

  enum role: { client: 0, admin: 1 }
end
