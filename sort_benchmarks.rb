# frozen_string_literal: true

# TODO: add more huge datasets

require './sort/bubble'
require './sort/comb'
require './sort/insertion'
require './sort/shell'
require './sort/selection'

BASE_DATA_SET = [
  [30, 11, 3, 2, 1, 109, 90, 4, 5, 10],
  [10, 20, 5, 4, 2, 10, 12, 10],
  [10, 1, 2, 3]
]

ALGORITHMS = {
  bubble: {
    classes: [Sort::Bubble, Sort::Comb],
  },
  insertion: {
    classes: [Sort::Insertion, Sort::Insertion2],
  },
  shell: {
    classes: [Sort::Shell],
  },
  selection: {
    classes: [Sort::Selection],
  },

}.freeze

ALGORITHMS.each do |alg_name, alg_data|
  puts "--- --- --- #{alg_name} --- --- ---\n\n"

  (alg_data[:data] || BASE_DATA_SET).each do |data|
    alg_data[:classes].each do |implementation|
      AlgorithmTracker.reset_tracker

      result = implementation.new.call(data.clone)

      puts "#{implementation.name}: #{data} => #{result}"
      puts AlgorithmTracker.stats
      puts "\n\n"
    end
  end
end
