class CreateIssueHistories < ActiveRecord::Migration
  def change
    create_table :issue_histories do |t|
      t.integer :book_id
      t.date :date_of_issue
      t.date :date_of_return
      t.integer :status
      t.integer :copies
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end