Hanami::Model.migration do
  change do
    drop_table? :weos
    create_table :weos do
      primary_key :id
      column :weo_contry_code, String, null: false, size: 3  # WEO Country Code
      column :iso, String, null: false                       # ISO
      column :weo_subject_code, String, null: false          # WEO Subject Code
      column :country, String, null: false                   # Country
      column :subject_desc, String                           # Subject Descriptor
      column :subject_note, String                           # Subject Notes
      column :units, String, null: false                     # Units
      column :scale, String, null: false                     # Scale
      column :year, String, size: 4                          # 1980 to 2022
      column :amount, BigDecimal                             # ammount of money
      column :estimate_start_after, String                   # Estimates Start After
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
