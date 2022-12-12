# Bechmarking the solutions for each day:

The `true` parameter in each execution runs the benchmark without output, as that would spam the console.

At the same time, `I/O` is **not** part of the benchmark, only the algorithm itself. On the other hand, parsing the data from the file is done inside the benchmark. This also takes the data in raw - it does not use any form of by hand manipulation of the data into a better format.

The code is also optimized for speed - so in some examples you might see simple `if - else if`, because that's the fastest I came up with.

First usage of `Threads` happens on **day 3**, as the previous days could not benefit from it. _Or could they...?_

## Day 1

[Folder](/day_1/)

![Benchmark day 1](/benchmark_images/day_1.png?)


## Day 2

[Folder](/day_2/)

![Benchmark day 2](/benchmark_images/day_2.png?)


## Day 3


[Folder](/day_3/)

![Benchmark day 3](/benchmark_images/day_3.png?)


## Day 4


[Folder](/day_4/)

![Benchmark day 4](/benchmark_images/day_4.png?)


## Day 5


[Folder](/day_5/)

![Benchmark day 5.1](/benchmark_images/day_5_1.png?)
![Benchmark day 5.2](/benchmark_images/day_5_2.png?)