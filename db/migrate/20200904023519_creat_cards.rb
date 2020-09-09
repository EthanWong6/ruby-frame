class CreatCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :desc

      t.bigint :book_id

      t.bigint :created_user_id, comment: '创建人 ID'
      t.bigint :updated_user_id, comment: '修改人 ID'
      t.datetime :disabled_at, comment: '删除时间'

      t.timestamps
    end
  end
end
