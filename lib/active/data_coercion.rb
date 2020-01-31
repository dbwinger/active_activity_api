# Mixins for coercing data to and from the API in expected formats
module Active
  module DataCoercion
    def coerce_from_api hash
      if hash
        hash.each do |k, v|
          hash[k] = coerce_value_from_api v
          if k == 'activityRecurrences'
            hash[k].map { |occurrence| Active::Occurrence.new(occurrence) }
          end
        end
      end
      hash['occurrences'] = hash.delete('activityRecurrences')
      hash
    end

    def coerce_value_from_api value
      # if value.is_a?(Array)
      #   value.map { |v1| coerce_value_from_api(v1) }
      # elsif value.is_a?(Hash)
      #   coerce_from_api(value)
      # else
      #   case value
      #   when 'T'
      #     true
      #   when 'F'
      #     false
      #   when /^\d{1,2}\/\d{1,2}\/\d{4} \d{2}:\d{2}$/
      #     DateTime.strptime(value, '%m/%d/%Y %H:%M').to_s
      #   when /^\d{1,2}\/\d{1,2}\/\d{4}$/
      #     Date.strptime(value, '%m/%d/%Y').to_s
      #   else
      #     value
      #   end
      # end
      value
    end

    def coerce_for_api hash
      hash.each do |k, v|
        hash[k] = coerce_value_for_api v
      end
    end

    def coerce_value_for_api value
      case value
      when true
        'T'
      when false
        'F'
      else
        value
      end
    end
  end
end
