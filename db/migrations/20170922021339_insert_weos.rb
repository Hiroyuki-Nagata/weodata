ENV['HANAMI_ENV'] ||= 'test'

require 'csv'
require_relative '../../config/environment'

Hanami.boot

Hanami::Model.migration do
  change do
    weo_data_set = File.expand_path('db/migrations/WEOApr2017all.csv')
    errors = []

    open(weo_data_set, "rb:ascii-8bit") do |f|
      CSV.new(f, col_sep: ",", headers: true, :quote_char => '"').each do |row|
        weo_array = []
        1980.upto(2022) do |year|
          ammount = if row[year.to_s].nil?
            0
          else
            row[year.to_s].gsub!(/,/, "")
          end
          weo = {
            weo_contry_code:  row["WEO Country Code"],
            iso:              row["ISO"],
            weo_subject_code: row["WEO Subject Code"],
            country:          row["Country"],
            subject_desc:     row["Subject Descriptor"],
            subject_note:     row["Subject Notes"],
            units:            row["Units"],
            scale:            row["Scale"],
            year:             year,
            amount:           ammount,
            estimate_start_after: row["Estimates Start After"]
          }
          weo_array << weo
        end

        begin
          WeoRepository.new.bulk_insert(weo_array)
        rescue => e
          errors << { error_type: e.class, message: e.message }
          puts "An error of type #{e.class} happened, message is #{e.message}"
        end
      end
    end
    puts errors.to_s
  end
end
