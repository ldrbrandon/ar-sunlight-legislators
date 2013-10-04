require 'csv'
require_relative '../app/models/legislator'

class SunlightLegislatorsImporter
  def self.import(filename)
    fields_we_dont_care_about = %w(name_suffix nickname district congress_office bioguide_id votesmart_id fec_id govtrack_id crp_id congresspedia_url youtube_url facebook_id official_rss senate_class)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      attribute_hash = {}
      row.each do |field, value|
        attribute_hash[field] = value unless fields_we_dont_care_about.include?(field)
      end
      legislator = Legislator.create!(attribute_hash)
    end
  end
end

# SunlightLegislatorsImporter.import('../db/data/legislators.csv')

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
