require_relative '../../db/config'

class Legislator < ActiveRecord::Base
  belongs_to :senator
  belongs_to :representative

  def self.populate_senators_and_representatives
    legislators = self.all

    legislators.each do |legislator|
      case legislator.title
      when "Rep"
        Representative.create!(legislator_id: legislator.id)
      when "Sen"
        Senator.create!(legislator_id: legislator.id)
      end
    end
  end
end


class Senator < ActiveRecord::Base
  has_many :legislators, dependent: :destroy

end


class Representative < ActiveRecord::Base
  has_many :legislators, dependent: :destroy

end