class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, presence: true, uniqueness: true
      t.string :password_hash, presence: true

      t.timestamps(null: false)
    end
  end
end
