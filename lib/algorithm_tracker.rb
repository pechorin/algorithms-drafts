# frozen_string_literal: true

require 'allocation_stats'

module AlgorithmTracker
  class << self
    def track_iteration
      @stats ||= {}
      @stats[:iterations] ||= 0
      @stats[:iterations]  += 1
    end

    def track_compare
      @stats ||= {}
      @stats[:compares] ||= 0
      @stats[:compares]  += 1
    end

    def reset_tracker
      @stats ||= {}
      @stats[:iterations]  = 0
      @stats[:compares]    = 0
    end

    def stats
      @stats || {}
    end

    def track_allocations(&block)
      AllocationStats.trace do
        block.call if block_given?
      end
    end
  end

  refine Integer do
    def upto(num)
      (self..num).each do |n|
        AlgorithmTracker.track_iteration
        yield n
      end
    end

    def >(other)
      AlgorithmTracker.track_compare
      super
    end

    def <(other)
      AlgorithmTracker.track_compare
      super
    end

    def ==(other)
      AlgorithmTracker.track_compare
      super
    end
  end
end
