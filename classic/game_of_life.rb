# frozen_string_literal: true

# rubocop:disable Metrics/ClassLength
class GameOfLife
  attr_reader :board, :cell_symbol, :board_x, :board_y

  def initialize(x = 10, y = 10, cell_symbol = 'X')
    @cell_symbol = cell_symbol
    @board_x     = x
    @board_y     = y
    @board       = build_empty_board(x, y)
  end

  def build_empty_board(x, y)
    result = Array.new(x)
    result.each_index { result[_1] = Array.new(y) }
    result
  end

  def run(loops: 10, init_cells: [])
    init_cells.each do |cell|
      board[cell[0]][cell[1]] = cell_symbol
    end

    print_life

    done_loops = 0
    while done_loops < loops
      # puts board.inspect

      @board = life
      clear_screen
      print_life
      sleep(0.1)

      done_loops += 1
    end

    board
  end

  private

  # Если в мертвой клетке рядом три живые - там рождается жизнь
  # Если у живой клетки рядом две или три живые - она продолжает жизнь
  #
  # Игра заканчивается, если конфигурация повторяется или не меняется (или все клетки погибли)
  #
  def life
    # 1. находим все живые клетки сверху в низ и слева направо
    # 2. считаем кол-во ее живых соседей, если 2-3 - остается жить, если меньше - умирает
    # 3. как оптимально находить зарождающиеся клетки?
    #    берем заполненную и проходимся по ближайшим умершим соседям и смотрим ее живых соседей, если их 3 - оживляем
    #    запоминаем обработанную мертвую клетку, чтобы не делать повторных вычислений

    new_state = build_empty_board(board_x, board_y)

    board.each_with_index do |line, line_idx|
      line.each_with_index do |cell, cell_idx|
        next unless cell

        # Находим всех соседей текущей живой клетки
        neighbors = cell_neighbors(line_idx, cell_idx)

        # Остается ли клетка жить или умирает?
        alive_count = 0
        neighbors.each_value { |data| alive_count += 1 if data[1] }
        new_state[line_idx][cell_idx] = board[line_idx][cell_idx] if alive_count >= 2

        # Зарождаем новую жизнь
        # (пока не оптимальный вариант)
        neighbors.each_value do |data|
          next if data[1] # если уже живая клетка, то пропускаем

          dead_cell_neigbors = cell_neighbors(data[0][0], data[0][1])
          alive_count = 0
          dead_cell_neigbors.each_value { |neigbor_data| alive_count += 1 if neigbor_data[1] }
          new_state[data[0][0]][data[0][1]] = cell_symbol if alive_count >= 3
        end
      end
    end

    new_state
  end

  def print_life
    board.each do |line|
      line.each do |cell|
        print(cell ? cell : '.')
        print ' '
      end

      print "\n"
    end

    puts "\n"
  end

  def clear_screen
    # puts "\e[H\e[2J"
  end

  def left_neigbor(line_idx, cell_idx)
    idx = cell_idx.zero? ? board_y - 1 : cell_idx - 1
    [[line_idx, idx], board[line_idx][idx]]
  end

  def top_neigbor(line_idx, cell_idx)
    top_idx = line_idx.zero? ? board_x - 1 : line_idx - 1
    [[top_idx, cell_idx], board[top_idx][cell_idx]]
  end

  def top_left_neigbor(line_idx, cell_idx)
    top_idxs,      = top_neigbor(line_idx, cell_idx)
    top_left_idxs, = left_neigbor(top_idxs[0], cell_idx)

    [[top_left_idxs[0], top_left_idxs[1]], board[top_left_idxs[0]][top_left_idxs[1]]]
  end

  def right_neigbor(line_idx, cell_idx)
    idx = cell_idx == board_y - 1 ? 0 : cell_idx + 1
    [[line_idx, idx], board[line_idx][idx]]
  end

  def top_right_neigbor(line_idx, cell_idx)
    top_idxs,       = top_neigbor(line_idx, cell_idx)
    top_right_idxs, = right_neigbor(top_idxs[0], cell_idx)

    [[top_right_idxs[0], top_right_idxs[1]], board[top_right_idxs[0]][top_right_idxs[1]]]
  end

  def bottom_neighbor(line_idx, cell_idx)
    bottom_idx = line_idx == board_x - 1 ? 0 : line_idx + 1
    [[bottom_idx, cell_idx], board[bottom_idx][cell_idx]]
  end

  def bottom_left_neigbor(line_idx, cell_idx)
    bottom_idxs,      = bottom_neighbor(line_idx, cell_idx)
    bottom_left_idxs, = left_neigbor(bottom_idxs[0], cell_idx)

    [[bottom_left_idxs[0], bottom_left_idxs[1]], board[bottom_left_idxs[0]][bottom_left_idxs[1]]]
  end

  def bottom_right_neigbor(line_idx, cell_idx)
    bottom_idxs,       = bottom_neighbor(line_idx, cell_idx)
    bottom_right_idxs, = right_neigbor(bottom_idxs[0], cell_idx)

    [[bottom_right_idxs[0], bottom_right_idxs[1]], board[bottom_right_idxs[0]][bottom_right_idxs[1]]]
  end

  def cell_neighbors(line_idx, cell_idx)
    {
      l: left_neigbor(line_idx, cell_idx),
      tl: top_left_neigbor(line_idx, cell_idx),
      r: right_neigbor(line_idx, cell_idx),
      tr: top_right_neigbor(line_idx, cell_idx),
      t: top_neigbor(line_idx, cell_idx),
      b: bottom_neighbor(line_idx, cell_idx),
      bl: bottom_left_neigbor(line_idx, cell_idx),
      br: bottom_right_neigbor(line_idx, cell_idx),
    }
  end
end
# rubocop:enable Metrics/ClassLength

GameOfLife.new(25, 25).run(loops: 10, init_cells: [
  [5, 5], [6, 5], [6, 6], [7, 4], [7, 5]
  # [3, 4], [3, 5], [4, 3], [4, 6], [5, 4], [5, 5]
  # [3, 4], [4, 5], [3, 6]
])
