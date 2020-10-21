class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,             presence: true
  validates :birthday,             presence: true
  validates :family_name_kanji,    presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角で入力してください" }
  validates :first_name_kanji,     presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角で入力してください" }
  validates :family_name_katakana, presence: true, format: { with: /\A[ァ-ン一-]+\z/, message: "全角カタカナで入力してください" }
  validates :first_name_katakana,     presence: true, format: { with: /\A[ァ-ン一-]+\z/, message: "全角カタカナで入力してください" }
  validate :password_complexity


  def password_complexity
    return if password =~ /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    errors.add :password, 'Include both letters and numbers'
  end
end
