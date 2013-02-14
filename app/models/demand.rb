class Demand < ActiveRecord::Base
  belongs_to :dependency
  belongs_to :user
  attr_accessible :address, :case, :last_name, :name, :dependency_id, :user_id, :estado
  
  validates :estado, :inclusion => { :in => %w(aprobado pendiente desaprobado) }
end
