# frozen_string_literal: true

require 'bundler/setup'
require 'markdown-tables'

# TODO: add more huge datasets
# TODO: track time

require './helpers'
require './sort/bubble'
require './sort/comb'
require './sort/insertion'
require './sort/shell'
require './sort/selection'
require './sort/merge'
require './sort/quick'
require './sort/binary_tree'

BASE_DATA_SET = [
  10.times.map { rand(1..10) },
  100.times.map { rand(1..100) },
  1000.times.map { rand(1..1000) },
]

ALGORITHMS = {
  'Простые алгоритмы сортировки': {
    bubble: {
      classes: [Sort::Bubble],
    },
    selection: {
      classes: [Sort::Selection],
    },
    comb: {
      classes: [Sort::Comb],
    }
  },
  'Сортировки на основе вставок': {
    insertion: {
      classes: [Sort::Insertion, Sort::Insertion2],
    },
    shell: {
      classes: [Sort::Shell],
    },
  },
  'Быстрые и эффективные алгоритмы сортировки': {
    merge: {
      classes: [Sort::Merge],
    },
    quick: {
      classes: [Sort::QuickNonEffective, Sort::QuickLomuto],
    },
    tree_sort: {
      classes: [Sort::BinaryTree],
    }
  },
}.freeze

ALGORITHMS.each do |alg_group, algorithms|
  puts "### #{alg_group}"
  table_labels = ['algorithm', 'implementation', 'dataset', 'iters', 'compares', 'allocs']
  table_data   = []

  algorithms.each do |alg_name, alg_data|
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
          .select { |cl, _| !cl.to_s.match('Sort') && !cl.to_s.match('Proc') }
          .map { |cl, d| [cl[0].to_s, d.count] }
          .to_h
          .to_json

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
  puts "\n\n"
end

