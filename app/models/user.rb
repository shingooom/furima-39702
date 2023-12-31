class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  validates :nickname, presence: true
  validates :first_name, presence: true,
                         format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'is invalid. Input full-width characters.' }
  validates :last_name, presence: true,
                        format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'is invalid. Input full-width characters.' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  validates :last_name_kana, presence: true,
                             format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  validates :birthday, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_ASCII_REGEX = /\A[\x21-\x7E]+\z/
  validates_format_of :password, with: VALID_PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers.'
  validates_format_of :password, with: VALID_ASCII_REGEX, message: 'is invalid. Input half-width characters.'
end
