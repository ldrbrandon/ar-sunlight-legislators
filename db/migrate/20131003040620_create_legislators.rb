require_relative '../config'

class CreateLegislators < ActiveRecord::Migration

  def change
    create_table :legislators do |t|
      t.string :title
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :state
      t.string :party
      t.binary :in_office
      t.string :gender
      t.string :phone
      t.string :fax
      t.string :website
      t.string :webform
      t.string :twitter_id
      t.string :birthdate

      t.timestamps
    end
  end

end