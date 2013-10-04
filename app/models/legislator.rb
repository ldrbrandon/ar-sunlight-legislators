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

  def self.list_reps_and_sens_for(state)
    puts "Senators for #{state}:"
    self.where(title: "Sen", state: "#{state}").each do |legislator| 
      puts "  #{legislator.firstname} #{legislator.lastname} (#{legislator.party})"
    end
    puts ""
    puts "Representatives for #{state}:"
    self.where(title: "Rep", state: "#{state}").each do |legislator| 
      puts "  #{legislator.firstname} #{legislator.lastname} (#{legislator.party})"
    end
  end

  def self.gender_percentage(gender)

    x_senators = Legislator.where(gender: "#{gender}", title: "Sen").count
    total_senators = Legislator.where(title: "Sen").count.to_f
    puts "#{gender} Senators: #{x_senators} (#{((x_senators/total_senators) * 100).to_i}%)"

    x_reps = Legislator.where(gender: "#{gender}", title: "Rep").count
    total_reps = Legislator.where(title: "Rep").count.to_f
    puts "#{gender} Representatives: #{x_reps} (#{((x_reps/total_reps) * 100).to_i}%)"

  end
end


class Senator < ActiveRecord::Base
  has_many :legislators, dependent: :destroy

end


class Representative < ActiveRecord::Base
  has_many :legislators, dependent: :destroy

end