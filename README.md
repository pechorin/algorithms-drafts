## Черновики моего бесконечного обучения алгоритмам.

### Структура папок:

- /classic: классические алгоритмы (Последовательность Фибоначи, НОД двух чисел и т.д.)
- /simple: простейшие алгоритмы для личного развития
- /search: алгоритмы поиска
- /sort: алгоритмы сортировки
- /trees: структуры данных относящихся к деревьям (графам)

### О подходе:

- Каждый алгоритм я реализую сам, поэтому скорее всего реализация будет далека от эталонной (это нужно для моего понимания)
- Некоторые алгоритмы реализованы несколько методами
- Счетчики итераций и аллокаций памяти пока работает не очень хорошо, но старается :)

## Текущие результаты реализаций алгоритмов сортировок

TODO: use table mode

```
--- --- --- bubble --- --- ---
Sort::Bubble: dataset size: 10 -> {:iterations=>75, :compares=>63, :allocations=>{[Array]=>18, [Range]=>11}}
Sort::Comb: dataset size: 10 -> {:iterations=>305, :compares=>254, :allocations=>{[Range]=>32, [Array]=>4}}
Sort::Bubble: dataset size: 100 -> {:iterations=>5250, :compares=>5148, :allocations=>{[Array]=>2395, [Range]=>101}}
Sort::Comb: dataset size: 100 -> {:iterations=>15450, :compares=>15149, :allocations=>{[Array]=>2198, [Range]=>202}}
Sort::Bubble: dataset size: 1000 -> {:iterations=>502500, :compares=>501498, :allocations=>{[Array]=>246257, [Range]=>1001}}
Sort::Comb: dataset size: 1000 -> {:iterations=>1504500, :compares=>1501499, :allocations=>{[Array]=>244726, [Range]=>2002}}

--- --- --- insertion --- --- ---
Sort::Insertion: dataset size: 10 -> {:iterations=>9, :compares=>1, :allocations=>{[Array]=>18, [Range]=>1}}
Sort::Insertion2: dataset size: 10 -> {:iterations=>34, :compares=>76, :allocations=>{[Array]=>1}}
Sort::Insertion: dataset size: 100 -> {:iterations=>99, :compares=>1, :allocations=>{[Array]=>2395, [Range]=>1}}
Sort::Insertion2: dataset size: 100 -> {:iterations=>2594, :compares=>5285, :allocations=>{[Array]=>1}}
Sort::Insertion: dataset size: 1000 -> {:iterations=>999, :compares=>1, :allocations=>{[Array]=>246257, [Range]=>1}}
Sort::Insertion2: dataset size: 1000 -> {:iterations=>253782, :compares=>508560, :allocations=>{[Array]=>1}}

--- --- --- selection --- --- ---
Sort::Selection: dataset size: 10 -> {:iterations=>55, :compares=>56, :allocations=>{[Array]=>1}}
Sort::Selection: dataset size: 100 -> {:iterations=>5050, :compares=>5051, :allocations=>{[Array]=>1}}
Sort::Selection: dataset size: 1000 -> {:iterations=>500500, :compares=>500501, :allocations=>{[Array]=>1}}

--- --- --- shell --- --- ---
Sort::Shell: dataset size: 10 -> {:iterations=>34, :compares=>59, :allocations=>{[Array]=>1}}
Sort::Shell: dataset size: 100 -> {:iterations=>982, :compares=>1443, :allocations=>{[Array]=>1}}
Sort::Shell: dataset size: 1000 -> {:iterations=>15122, :compares=>22628, :allocations=>{[Array]=>1}}

--- --- --- merge --- --- ---
Sort::Merge: dataset size: 10 -> {:iterations=>20, :compares=>51, :allocations=>{[Array]=>20}}
Sort::Merge: dataset size: 100 -> {:iterations=>453, :compares=>912, :allocations=>{[Array]=>200}}
Sort::Merge: dataset size: 1000 -> {:iterations=>7929, :compares=>14117, :allocations=>{[Array]=>2000}}

--- --- --- quick --- --- ---
Sort::QuickNonEffective: dataset size: 10 -> {:iterations=>0, :compares=>63, :allocations=>{[Array]=>21}}
Sort::QuickNonEffective: dataset size: 100 -> {:iterations=>0, :compares=>1145, :allocations=>{[Array]=>181}}
Sort::QuickNonEffective: dataset size: 1000 -> {:iterations=>0, :compares=>22459, :allocations=>{[Array]=>1969}}

--- --- --- heap --- --- ---
Sort::Heap: dataset size: 10 -> {:iterations=>0, :compares=>0, :allocations=>{[Array]=>22}}
Sort::Heap: dataset size: 100 -> {:iterations=>0, :compares=>0, :allocations=>{[Array]=>172}}
Sort::Heap: dataset size: 1000 -> {:iterations=>0, :compares=>0, :allocations=>{[Array]=>1951}}
```
