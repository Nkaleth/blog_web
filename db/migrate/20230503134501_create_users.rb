class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, default: '/assets/user_avatar-svgrepo-com.svg'
      t.text :bio
      t.integer :post_counter, default: 0
      t.timestamps
    end
  end
end
