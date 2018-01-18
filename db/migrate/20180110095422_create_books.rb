class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :isbn
      t.string :author
      t.decimal :price, precision: 3
      t.string :publication
      t.string :version
      t.references :library, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :issue_history, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end