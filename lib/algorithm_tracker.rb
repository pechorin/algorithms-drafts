# frozen_string_literal: true

module AlgorithmTracker
  class << self
    def track_iteration
      @stats ||= {}
      @stats[:iterations] ||= 0
      @stats[:iterations]  += 1
    end

    def track_allocation
      @stats ||= {}
      @stats[:allocations] ||= 0
      @stats[:allocations]  += 1
    end

    def track_compare
      @stats ||= {}
      @stats[:compares] ||= 0
      @stats[:compares]  += 1
    end

    def reset_tracker
      @stats ||= {}
      @stats[:allocations] = 0
      @stats[:iterations]  = 0
      @stats[:compares]    = 0
    end

    def stats
      @stats || {}
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

  refine Array do
    alias_method :set, :[]=

    def []=(idx, val)
      AlgorithmTracker.track_allocation
      set(idx, val)
    end
  end
end
