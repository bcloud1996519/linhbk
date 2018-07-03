class User < ApplicationRecord
  before_save :email_downcase

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true,
    length: {maximum: Settings.length.maximum_name_string}
  validates :email, presence: true,
    length: {maximum: Settings.length.maximum_email_string},
      format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.length.minimum_password_string}
  has_secure_password

  private

  def email_downcase
    email.downcase!
  end
end
