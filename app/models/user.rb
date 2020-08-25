class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # validates :nickname, presence: true
  
  # validates :password, uniqueness: true
  #                      presence: true
  #                      length: { minimum: 6 }
  #                      format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,/^[a-zA-Z0-9]+$/
  #                    }

  # validates :family_name, presence: true
  #                      format: { with:  /^[ぁ-んァ-ヶー一-龠]+$/ }
  #           :first_name,  presence: true 
  #                         format: { with:  /^[ぁ-んァ-ヶー一-龠]+$/ }
  #           :family_name_kana, presence: true
  #                              format: { with:/^[ア-ン゛゜ァ-ォャ-ョー「」、]+$/ }
  #           :first_name_kana, presence: true
  #                             format: { with:/^[ア-ン゛゜ァ-ォャ-ョー「」、]+$/ }
  #           :birthday, presence: true                                     
end
