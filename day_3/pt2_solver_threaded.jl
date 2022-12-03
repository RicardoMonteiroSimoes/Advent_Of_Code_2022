using BenchmarkTools


function solveTask2Threaded(input, printout)
    #split array
    total = Threads.Atomic{Int}(0)
    input = reshape(input, (3, 100))
    Threads.@threads for i in 1:100
        firstElf = Set(input[1,i])
        secondElf = Set(input[2,i])
        thirdElf = Set(input[3,i])
        multiple = filter(x -> x in firstElf, secondElf)
        multiple = pop!(filter(x -> x in thirdElf, multiple))
        if multiple >= 'a'
            Threads.atomic_add!(total, Int(multiple) - 96)
        else
            Threads.atomic_add!(total, Int(multiple) - 38)
        end
    end
    if printout
        println("Solution is $total")
    end
end


function day3part2SolveTaskThreaded()
    day3part2SolveTaskThreaded(false)
end


function day3part2SolveTaskThreaded(bench)
    rows = readlines("input.csv")
    if bench
        @benchmark solveTask2Threaded($rows, false)
    else
        solveTask2Threaded(rows, true)
    end
end