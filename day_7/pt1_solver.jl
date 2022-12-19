using BenchmarkTools
using DataStructures

const QUEUE = Deque{Char}()
const input = readline("input.csv")

function solvePart1(input, printout)
    index = Int8(1)
    for c in (input) 
        length(QUEUE) == 4 && popfirst!(QUEUE)
        push!(QUEUE, c)
        setLength = length(Set(QUEUE))
        if(setLength == 4)
            break
        end 
        index += 1
    end
    if printout
        println("index is $index")
        return index
    end
end

function day7Part1SolveTask()
    day7Part1SolveTask(false)
end

function day7Part1SolveTask(bench)
    if bench
        @benchmark solvePart1($input, false)
    else
        solvePart1(input, true)
    end    
end

