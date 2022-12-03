using BenchmarkTools


function solveTask2(input, printout)
    #split array
    total = 0
    input = reshape(input, (3, 100))
    for i in 1:100
        firstElf = input[1,i]
        secondElf = input[2,i]
        thirdElf = input[3,i]
        multiple = filter(x -> x in firstElf, secondElf)
        multiple = getindex(filter(x -> x in thirdElf, multiple), 1)
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


function day3part2SolveTask()
    day3part2SolveTask(false)
end


function day3part2SolveTask(bench)
    rows = readlines("input.csv")
    if bench
        @benchmark solveTask2($rows, false)
    else
        solveTask2(rows, true)
    end
end