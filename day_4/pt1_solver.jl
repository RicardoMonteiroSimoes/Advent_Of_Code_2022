using BenchmarkTools

function solvePart1(input, printout)
    total = Threads.Atomic{Int}(0)
    Threads.@threads for row in input
        parts = split(row, ",")
        rangeOne = parse.(Int, split(parts[1], "-"))
        rangeTwo = parse.(Int, split(parts[2], "-"))
        if rangeOne[1] <= rangeTwo[1] && rangeOne[2] >= rangeTwo[2]
            Threads.atomic_add!(total, 1)
        elseif rangeOne[1] >= rangeTwo[1] && rangeOne[2] <= rangeTwo[2]
            Threads.atomic_add!(total, 1)
        end
    end
    if printout
        println("Total of $total assignments match the critera")
    end
end



function day4Part1SolveTask()
    day4Part1SolveTask(false)
end

function day4Part1SolveTask(bench)
    input = readlines("input.csv")
    if bench
        @benchmark solvePart1($input, false)
    else
        solvePart1(input, true)
    end    
end

