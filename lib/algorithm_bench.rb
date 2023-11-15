# frozen_string_literal: true

module AlgorithmBench
  def reg_iter(message)
    increase_counter
    puts message
  end

  def reg_sub_iter(message)
    increase_sub_counter
    puts message
  end

  def allocate_in_array(arr, idx, value)
    arr[idx] = value

    increase_allocations
  end

  def stats
    {
      total_iterations: @total_iterations,
      n_iterations: @iterations,
      n2_iterations: @sub_iterations,
      total_allocations: @total_allocations
    }
  end

  private

  def increase_counter
    @iterations ||= 0
    @iterations += 1

    increase_total
  end

  def increase_sub_counter
    @sub_iterations ||= 0
    @sub_iterations += 1

    increase_total
  end

  def increase_total
    @total_iterations ||= 0
    @total_iterations += 1
  end

  def increase_allocations
    @total_allocations ||= 0
    @total_allocations += 1
  end
end
