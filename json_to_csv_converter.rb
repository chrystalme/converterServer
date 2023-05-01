# frozen_string_literal: true

require 'csv'

class JsonToCsvConverter
  def self.convert(json_payload)
    CSV.generate do |csv|
      # Write CSV headers from first JSON object
      csv << json_payload.first.keys

      json_payload.each do |obj|
        csv << obj.values
      end
    end
  end
end
