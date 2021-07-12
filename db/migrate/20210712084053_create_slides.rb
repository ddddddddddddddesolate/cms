# frozen_string_literal: true

class CreateSlides < ActiveRecord::Migration[6.1]
  def change
    create_table :slides do |t|
      t.belongs_to :playlist, null: false, foreign_key: true
      t.belongs_to :content, null: false, foreign_key: true
      t.bigint :weight, null: true, default: 0

      t.timestamps
    end
  end
end
