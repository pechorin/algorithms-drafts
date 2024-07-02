module AlgorithmTracker
  class << self
    def track_iteration
      $stats ||= {}
      $stats[:iterations] ||= 0
      $stats[:iterations]  += 1
    end

    def track_allocation
      $stats ||= {}
      $stats[:allocations] ||= 0
      $stats[:allocations]  += 1
    end
  end

  refine Integer do
    def upto(num)
      (self..num).each do |n|
        AlgorithmTracker.track_iteration
        yield n
      end
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
