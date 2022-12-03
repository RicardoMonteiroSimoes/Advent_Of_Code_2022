using BenchmarkTools


function solveTask1(input, printout)
    #split array
    total = 0
    for row in input
        half = Int(length(row)/2)
        firstHalf = Set((x -> collect(x)).(row[1:half]))
        secondHalf = Set((x -> collect(x)).(row[half+1:end]))
        multiple = pop!(filter(x -> x in firstHalf, secondHalf))
        if multiple >= 'a'
            total += Int(multiple) - 96
        else
            total += Int(multiple) - 38
        end
    end
    if printout
        println("Solution is $total")
    end
end


function day3part1SolveTask()
    day3part1SolveTask(false)
end


function day3part1SolveTask(bench)
    rows = readlines("input.csv")
    if bench
        @benchmark solveTask1($rows, false)
    else
        solveTask1(rows, true)
    end
end