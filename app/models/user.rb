# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  devise :confirmable,
         :database_authenticatable,
         :lockable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_many :images

  def to_h
    {
      id:      id,
      email:   email,
      token:   token,
      created: created_at
    }
  end
end
