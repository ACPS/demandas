class User < ActiveRecord::Base
  attr_accessible :name, :password, :tipo, :password_confirmation, :email, :cellphone, :user_id
  
  has_many :demands
  validates :name,  :presence =>true
  validates :password, :confirmation =>{:message => "Las contrasenas no coinciden"},
            :presence =>true
        
  validates :password_confirmation, :presence => true
  validates :name, :uniqueness =>true
  validates :email, :uniqueness =>true,
                    :presence => true  
  validates :cellphone,  :presence => true                          
 end
