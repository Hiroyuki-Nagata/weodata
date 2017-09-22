require 'csv'

Hanami::Model.migration do
  change do

    sqls = %{
      INSERT INTO weos VALUES (weo_contry_code
                              , iso
                              , weo_subject_code
                              , country
                              , subject_desc
                              , subject_note
                              , units
                              , scale
                              , year
                              , amount
                              , estimate_start_after)
    }

    weo_data_set = File.expand_path('db/migrations/WEOApr2017all.xls')

    CSV.foreach(weo_data_set, col_sep: "\t", headers: true) do |row|

      1980.upto(2022) do |year|
        cols = [
          row["WEO Country Code"],
          row["ISO"],
          row["WEO Subject Code"],
          row["Country"],
          row["Subject Descriptor"],
          row["Subject Notes"],
          row["Units"],
          row["Scale"],
          year,
          row[year.to_s],
          row["Estimates Start After"]
        ]
        sqls << " ('#{cols.join("', '")}'),"
      end
    sqls.chomp!(",")
    sqls << ";"
    execute sqls
    end
  end
end
