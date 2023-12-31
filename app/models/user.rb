# == Schema Information
# Schema version: 20231103095111
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#  username               :string
#  word_books_count       :integer
#  words_count            :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  has_many :notes, dependent: :destroy
  before_save :downcase_fields
  has_many :word_books, dependent: :destroy
  has_many :words, through: :word_books
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
          :registerable,
          :recoverable, 
          :rememberable, 
          :validatable, 
          :omniauthable,
          authentication_keys: [:login]

  validates :email, uniqueness: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validate :validate_username

  attr_writer :login

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user |
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def login
    @login || username || email
  end

  def validate_username
    return unless User.where(email: username).exists?
      errors.add(:username, :invalid)
    
  end

  def downcase_fields
    username.downcase!
    email.downcase!
  end


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["username = :value OR email = :value", { value: login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

end
