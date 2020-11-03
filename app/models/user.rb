class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :transactions

  def generate_jwt
    JWT.encode({id: id, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
  end

  # When a user sees their balance, they only see their full points balance, not where the points came from
  def total_points
    self.transactions.map{|tran| tran.points}.reduce(:+)
  end

end