# frozen_string_literal: true

require 'bundler/setup'
require 'markdown-tables'

# TODO: add more huge datasets
# TODO: track time
# TODO: stats is broken

require './helpers'
require './sort/bubble'
require './sort/comb'
require './sort/insertion'
require './sort/shell'
require './sort/selection'
require './sort/merge'
require './sort/quick'
require './sort/heap'

BASE_DATA_SET = [
  10.times.map { rand(1..10) },
  100.times.map { rand(1..100) },
  1000.times.map { rand(1..1000) },
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
  quick: {
    classes: [Sort::QuickNonEffective, Sort::QuickLomuto],
  },
  heap: {
    classes: [Sort::Heap],
  }
}.freeze

table_labels = ['algorithm', 'implementation', 'dataset', 'iters', 'compares', 'allocs']
table_data   = []

ALGORITHMS.each do |alg_name, alg_data|
  (alg_data[:data] || BASE_DATA_SET).each do |data|
    alg_data[:classes].each do |implementation|
      AlgorithmTracker.reset_tracker

      result = nil

      stats = AlgorithmTracker.track_allocations do
        result = implementation.new.call(data.clone)

        unless check_sorting(result)
          raise "Sorting failed for #{implementation}, result: #{result.inspect}"
        end
      end

      allocation_stats = stats.allocations \
        .group_by(:class)
        .sort_by_count
        .to_a
        .select { |cl, _| cl.to_s == '[Array]' || cl.to_s == '[String]' || cl.to_s == '[Range]' }
        .map { |cl, d| [cl, d.count] }
        .to_h

      algo_stats = AlgorithmTracker.stats
      algo_stats.merge!(allocations: allocation_stats)

      table_data << [
        alg_name,
        implementation.name.to_s,
        "rand #{data.size}",
        algo_stats[:iterations],
        algo_stats[:compares],
        algo_stats[:allocations],
      ]
    end
  end
end

puts MarkdownTables.make_table(table_labels, table_data, is_rows: true)
