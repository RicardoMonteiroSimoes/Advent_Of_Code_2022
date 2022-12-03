using BenchmarkTools


function solveTask1Threaded(input, printout)
    #split array
    total = Threads.Atomic{Int}(0)
    Threads.@threads for row in input
        half = Int(length(row)/2)
        firstHalf = row[1:half]
        secondHalf = row[half+1:end]
        multiple = getindex((filter(x -> x in firstHalf, secondHalf)), 1)
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


function day3part1SolveTaskThreaded()
    day3part1SolveTaskThreaded(false)
end


function day3part1SolveTaskThreaded(bench)
    rows = readlines("input.csv")
    if bench
        @benchmark solveTask1Threaded($rows, false)
    else
        solveTask1Threaded(rows, true)
    end
end