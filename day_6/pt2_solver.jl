using BenchmarkTools
using DataStructures

const QUEUE = Deque{Char}()
const SMALL_QUEUE = Deque{Char}()
const input = readline("input.csv")

function solvePart2(input, printout)
    index = Int8(1)
    for c in (input) 
        length(SMALL_QUEUE) == 4 && popfirst!(SMALL_QUEUE)
        length(QUEUE) == 14 && popfirst!(QUEUE)
        push!(SMALL_QUEUE, c)
        push!(QUEUE, c)
        if(length(Set(SMALL_QUEUE)) == 4 && length(Set(QUEUE)) == 14)
            break
        end
        index += 1
    end
    if printout
        println("index is $i")
    end
end

function day6Part2SolveTask()
    day6Part2SolveTask(false)
end

function day6Part2SolveTask(bench)
    if bench
        @benchmark solvePart2($input, false)
    else
        solvePart2(input, true)
    end    
end

