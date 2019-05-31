class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text      :title, null: false
      t.text      :body, null: false
      t.integer   :user_id, null: false
      t.timestamps null: false
    end
  end
end
