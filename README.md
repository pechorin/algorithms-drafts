## Черновики моего бесконечного обучения алгоритмам.

### Структура папок:

- /classic: классические алгоритмы (Game of life, последовательность Фибоначи, НОД двух чисел и т.д.)
- /simple: простейшие алгоритмы для личного развития
- /search: алгоритмы поиска
- /sort: алгоритмы сортировки
- /trees: структуры данных относящихся к деревьям (графам)

### О подходе:

- Каждый алгоритм я реализую сам, поэтому скорее всего реализация будет далека от эталонной (это нужно для моего понимания)
- Некоторые алгоритмы реализованы несколько методами
- Счетчики итераций и аллокаций памяти пока работает не очень хорошо, но старается :)

## Текущие результаты реализаций алгоритмов

### Простые алгоритмы сортировки
|algorithm|implementation|dataset|iters|compares|allocs|
|:-:|:-:|:-:|:-:|:-:|:-:|
|bubble|Sort::Bubble|rand 10|75|63|{"Array":26,"Range":11}|
|bubble|Sort::Bubble|rand 100|5250|5148|{"Array":2520,"Range":101}|
|bubble|Sort::Bubble|rand 1000|502500|501498|{"Array":260214,"Range":1001}|
|selection|Sort::Selection|rand 10|55|56|{"Array":1}|
|selection|Sort::Selection|rand 100|5050|5051|{"Array":1}|
|selection|Sort::Selection|rand 1000|500500|500501|{"Array":1}|
|comb|Sort::Comb|rand 10|305|254|{"Range":32,"Array":11}|
|comb|Sort::Comb|rand 100|15450|15149|{"Array":2288,"Range":202}|
|comb|Sort::Comb|rand 1000|1504500|1501499|{"Array":258253,"Float":177000,"Range":2002}|


### Сортировки на основе вставок
|algorithm|implementation|dataset|iters|compares|allocs|
|:-:|:-:|:-:|:-:|:-:|:-:|
|insertion|Sort::Insertion|rand 10|9|1|{"Array":26,"Range":1}|
|insertion|Sort::Insertion2|rand 10|24|58|{"Array":1}|
|insertion|Sort::Insertion|rand 100|99|1|{"Array":2520,"Range":1}|
|insertion|Sort::Insertion2|rand 100|2488|5072|{"Array":1}|
|insertion|Sort::Insertion|rand 1000|999|1|{"Array":260214,"Range":1}|
|insertion|Sort::Insertion2|rand 1000|239770|480539|{"Array":1}|
|shell|Sort::Shell|rand 10|35|56|{"Array":1}|
|shell|Sort::Shell|rand 100|867|1322|{"Array":1}|
|shell|Sort::Shell|rand 1000|15162|22639|{"Array":1}|


### Быстрые и эффективные алгоритмы сортировки
|algorithm|implementation|dataset|iters|compares|allocs|
|:-:|:-:|:-:|:-:|:-:|:-:|
|merge|Sort::Merge|rand 10|18|49|{"Array":20}|
|merge|Sort::Merge|rand 100|473|929|{"Array":200}|
|merge|Sort::Merge|rand 1000|7925|14103|{"Array":2000}|
|quick|Sort::QuickNonEffective|rand 10|4|51|{"Array":17}|
|quick|Sort::QuickLomuto|rand 10|9|127|{"Array":1}|
|quick|Sort::QuickNonEffective|rand 100|47|1333|{"Array":189}|
|quick|Sort::QuickLomuto|rand 100|99|10297|{"Array":1}|
|quick|Sort::QuickNonEffective|rand 1000|474|22421|{"Array":1897}|
|quick|Sort::QuickLomuto|rand 1000|999|1002997|{"Array":1}|
|tree_sort|Sort::BinaryTree|rand 10|6|24|{"Array":19,"Trees::Binary::Node":6,"Trees::Binary":1}|
|tree_sort|Sort::BinaryTree|rand 100|67|873|{"Array":202,"Trees::Binary::Node":67,"Trees::Binary":1}|
|tree_sort|Sort::BinaryTree|rand 1000|629|15457|{"Array":1888,"Trees::Binary::Node":629,"Trees::Binary":1}|
