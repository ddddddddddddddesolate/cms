# frozen_string_literal: true

class CreateDisplays < ActiveRecord::Migration[6.1]
  def change
    create_table :displays do |t|
      t.string :name
      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
