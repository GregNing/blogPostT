class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string   :title, null: false
      t.text     :content, null: false
      t.integer     :state, default: 0

      t.references :user, foreign_key: true
      t.references :blog, foreign_key: true
      t.timestamps
    end
  end
end
