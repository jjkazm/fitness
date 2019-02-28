class User < ApplicationRecord
  has_many :exercises, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  paginates_per 10

  def full_name
    [first_name, last_name].join(" ")
  end

  def self.search_by_name(name)
    where('first_name LIKE ? or last_name LIKE ?', name, name).order(:first_name)
  end


end
