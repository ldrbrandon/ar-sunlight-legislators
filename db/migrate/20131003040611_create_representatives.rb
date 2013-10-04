require_relative '../config'

class CreateRepresentatives < ActiveRecord::Migration

  def change
    create_table :representatives do |t|
      t.integer :legislator_id

      t.timestamps
    end
  end

end