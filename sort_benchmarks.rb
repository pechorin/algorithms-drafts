# frozen_string_literal: true

# TODO: add more huge datasets

require './sort/bubble'
require './sort/comb'
require './sort/insertion'
require './sort/shell'
require './sort/selection'
require './sort/merge'

BASE_DATA_SET = [
  10.times.map { rand(1..10) },
  100.times.map { rand(1..100) },
]

ALGORITHMS = {
  bubble: {
    classes: [Sort::Bubble, Sort::Comb],
  },
  insertion: {
    classes: [Sort::Insertion, Sort::Insertion2],
  },
  selection: {
    classes: [Sort::Selection],
  },
  shell: {
    classes: [Sort::Shell],
  },
  merge: {
    classes: [Sort::Merge],
  },

}.freeze

# TODO: add sort result check method

ALGORITHMS.each do |alg_name, alg_data|
  puts "\n--- --- --- #{alg_name} --- --- ---\n"

  (alg_data[:data] || BASE_DATA_SET).each do |data|
    alg_data[:classes].each do |implementation|
      AlgorithmTracker.reset_tracker

      result = implementation.new.call(data.clone)

      puts "#{implementation.name}: dataset size: #{data.size} -> #{AlgorithmTracker.stats.inspect}\n"
    end
  end
end
