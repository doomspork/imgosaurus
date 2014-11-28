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
end
