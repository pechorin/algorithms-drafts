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

|algorithm|implementation|dataset|iters|compares|allocs|
|:-:|:-:|:-:|:-:|:-:|:-:|
|bubble|Sort::Bubble|rand 10|75|63|{[Array]=>19, [Range]=>11}|
|bubble|Sort::Comb|rand 10|305|254|{[Range]=>32, [Array]=>12}|
|bubble|Sort::Bubble|rand 100|5250|5148|{[Array]=>2244, [Range]=>101}|
|bubble|Sort::Comb|rand 100|15450|15149|{[Array]=>2146, [Range]=>202}|
|bubble|Sort::Bubble|rand 1000|502500|501498|{[Array]=>249311, [Range]=>1001}|
|bubble|Sort::Comb|rand 1000|1504500|1501499|{[Array]=>248407, [Range]=>2002}|
|insertion|Sort::Insertion|rand 10|9|1|{[Array]=>19, [Range]=>1}|
|insertion|Sort::Insertion2|rand 10|29|68|{[Array]=>1}|
|insertion|Sort::Insertion|rand 100|99|1|{[Array]=>2244, [Range]=>1}|
|insertion|Sort::Insertion2|rand 100|2761|5619|{[Array]=>1}|
|insertion|Sort::Insertion|rand 1000|999|1|{[Array]=>249311, [Range]=>1}|
|insertion|Sort::Insertion2|rand 1000|250687|502372|{[Array]=>1}|
|selection|Sort::Selection|rand 10|55|56|{[Array]=>1}|
|selection|Sort::Selection|rand 100|5050|5051|{[Array]=>1}|
|selection|Sort::Selection|rand 1000|500500|500501|{[Array]=>1}|
|shell|Sort::Shell|rand 10|35|59|{[Array]=>1}|
|shell|Sort::Shell|rand 100|860|1326|{[Array]=>1}|
|shell|Sort::Shell|rand 1000|16549|24050|{[Array]=>1}|
|merge|Sort::Merge|rand 10|17|48|{[Array]=>20}|
|merge|Sort::Merge|rand 100|478|948|{[Array]=>200}|
|merge|Sort::Merge|rand 1000|7908|14115|{[Array]=>2000}|
|quick|Sort::QuickNonEffective|rand 10|0|53|{[Array]=>17}|
|quick|Sort::QuickLomuto|rand 10|0|127|{[Array]=>1}|
|quick|Sort::QuickNonEffective|rand 100|0|1341|{[Array]=>197}|
|quick|Sort::QuickLomuto|rand 100|0|10297|{[Array]=>1}|
|quick|Sort::QuickNonEffective|rand 1000|0|20889|{[Array]=>1933}|
|quick|Sort::QuickLomuto|rand 1000|0|1002997|{[Array]=>1}|
|heap|Sort::Heap|rand 10|0|0|{[Array]=>19}|
|heap|Sort::Heap|rand 100|0|0|{[Array]=>199}|
|heap|Sort::Heap|rand 1000|0|0|{[Array]=>1894}|
