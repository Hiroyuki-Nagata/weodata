ENV['HANAMI_ENV'] ||= 'test'

require 'csv'
require_relative '../../config/environment'

Hanami.boot

Hanami::Model.migration do
  change do

#    sqls = %{
#      INSERT INTO weos VALUES (weo_contry_code
#                              , iso
#                              , weo_subject_code
#                              , country
#                              , subject_desc
#                              , subject_note
#                              , units
#                              , scale
#                              , year
#                              , amount
#                              , estimate_start_after)
#    }

    weo_data_set = File.expand_path('db/migrations/WEOApr2017all.xls')
    weo_array = []

    CSV.foreach(weo_data_set, col_sep: "\t", headers: true) do |row|
      1980.upto(2022) do |year|
        weo = WeoRepository.new.create(
          weo_contry_code:  row["WEO Country Code"],
          iso:              row["ISO"],
          weo_subject_code: row["WEO Subject Code"],
          country:          row["Country"],
          subject_desc:     row["Subject Descriptor"],
          subject_note:     row["Subject Notes"],
          units:            row["Units"],
          scale:            row["Scale"],
          year:             year,
          amount:           row[year.to_s],
          estimate_start_after: row["Estimates Start After"]
        )
      end
    # finish
    end
  end
end
