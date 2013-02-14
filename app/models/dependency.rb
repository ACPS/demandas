class Dependency < ActiveRecord::Base
  attr_accessible :descripcion
  
  has_many :demands
end
