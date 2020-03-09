class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Permitir apenas letras, números, sublinhados e pontuação. PARA NÃO TER @
  validates_format_of :name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
end
