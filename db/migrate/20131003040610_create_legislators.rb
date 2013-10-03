require_relative '../config'

class CreateLegislators < ActiveRecord::Migration

  def change
    create_table :legislators do |t|
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :state_id
      t.integer :party_id
      t.boolean :in_office
      t.string :gender
      t.string :phone
      t.string :fax
      t.string :website
      t.string :webform
      t.string :twitter_id
      t.date :birthdate

      t.timestamps
    end
  end

end