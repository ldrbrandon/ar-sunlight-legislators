require_relative '../../db/config'

class State < ActiveRecord::Base
  has_many :legislators # can only have 2 senators

end
