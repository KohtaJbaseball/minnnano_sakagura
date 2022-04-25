class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_drinks, dependent: :destroy
  has_many :favorites, dependent: :destroy

  enum sex: { man: 0, woman: 1, others: 2 }

  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("nickname LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("nickname LIKE?", "#{word}%")
    elsif search == "backword_match"
      @user = User.where("nickname LIKE?", "%#{word}")
    elsif search == "partial_match"
      @user = User.where("nickname LIKE?", "%#{word}%")
    else
      @user = User.all
    end
  end
        
end
