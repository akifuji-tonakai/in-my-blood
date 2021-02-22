class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :youtubepath, null: false
      t.references    :tag, null: false, foreign_key: true
      t.timestamps
    end
  end
end
