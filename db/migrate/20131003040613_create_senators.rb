require_relative '../config'

class CreateSenators < ActiveRecord::Migration

  def change
    create_table :senators do |t|
      t.integer :legislator_id

      t.timestamps
    end
  end

end