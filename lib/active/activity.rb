require 'ostruct'
# require 'run_signup/data_coercion'

# Wrap the API results for a race in an class, and do some data coercion
module Active
  class Activity < OpenStruct
    include Active::DataCoercion

    # def initialize hash = nil
    #   super coerce_from_api hash
    # end
  end

  class Occurrence < OpenStruct; end;
end