class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :birthday
    validates :family_name_kanji,    format: { with: /\A[ぁ-んァ-ヶー一-龥]+\z/, message: 'Full-width characters' }
    validates :first_name_kanji,     format: { with: /\A[ぁ-んァ-ヶー一-龥]+\z/, message: 'Full-width characters' }
    validates :family_name_katakana, format: { with: /\A[ァ-ヶー]+\z/, message: 'Full-width katakana characters' }
    validates :first_name_katakana,  format: { with: /\A[ァ-ヶー]+\z/, message: 'Full-width katakana characters' }
  end
  validate :password_complexity

  def password_complexity
    return if password =~ /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

    errors.add :password, 'Include both letters and numbers'
  end
end
