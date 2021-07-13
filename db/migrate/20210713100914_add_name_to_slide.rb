# frozen_string_literal: true

class AddNameToSlide < ActiveRecord::Migration[6.1]
  def change
    add_column :slides, :name, :string
  end
end
