class Demo < ActiveRecord::Migration[7.0]
  def change
    create_table :demo do |d|
      d.string :name
    end

    reversible do |dir|
      dir.up do
        # add a CHECK constraint
        execute <<-SQL
          ALTER TABLE demo
            ADD CONSTRAINT zipchk
              
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE demo
            DROP CONSTRAINT zipchk
        SQL
      end
    end
   add_column :users, :home_page_url, :string
    rename_column :users, :email, :email_address
  end
end
