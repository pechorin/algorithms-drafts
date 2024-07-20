# frozen_string_literal: true

require './sort/bubble_sort'
require './sort/comb_sort'

CASES = {
  bubble: {
    classes: [
      Sort::Bubble, Sort::Comb
    ],
    data: [
      # [30, 11, 3, 2, 1, 109, 90, 4, 5, 10],
      # [10, 20, 5, 4, 2, 10, 12, 10],
      [10, 1, 2, 3]
    ]
  },
}.freeze

CASES.each do |case_name, case_data|
  puts "- #{case_name}"
  (case_data[:data] || []).each do |data|
    case_data[:classes].each do |impl|
      AlgorithmTracker.reset_tracker

      result = impl.new.call(data)

      puts "#{impl.name}: #{data} => #{result}"
      puts AlgorithmTracker.stats
      puts '---'
    end
  end
end
