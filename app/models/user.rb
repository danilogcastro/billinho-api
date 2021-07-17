# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend Devise::Models
  
  devise :database_authenticatable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
