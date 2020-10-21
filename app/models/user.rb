class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,             presence: true, uniqueness: true
  validates :birthday,             presence: true
  validates :family_name_kanji,    presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/, message: "Full-width characters" }
  validates :first_name_kanji,     presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/, message: "Full-width characters" }
  validates :family_name_katakana, presence: true, format: { with: /\A[ァ-ヶ一-]+\z/, message: "Full-width katakana characters" }
  validates :first_name_katakana,  presence: true, format: { with: /\A[ァ-ヶ一-]+\z/, message: "Full-width katakana characters" }
  validate :password_complexity


  def password_complexity
    return if password =~ /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    errors.add :password, 'Include both letters and numbers'
  end
end
