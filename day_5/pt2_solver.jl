using BenchmarkTools
using DataStructures

const COLUMN_INDEXES = [2, 6, 10, 14, 18, 22, 26, 30, 34]
const STACKS = [
    Deque{Char}(),
    Deque{Char}(),
    Deque{Char}(),
    Deque{Char}(),
    Deque{Char}(),
    Deque{Char}(),
    Deque{Char}(),
    Deque{Char}(),
    Deque{Char}(),
]

function solvePart2(input, printout)
    total = 0
    passedToMove = false
    for row in input
        if !passedToMove
            if row == ""
                passedToMove = true
            elseif row[2] == '1'
                continue
            else
                for i in eachindex(COLUMN_INDEXES)
                    col = COLUMN_INDEXES[i]
                    if row[col] != ' '
                        push!(STACKS[i], row[col])
                    end
                end
            end
        else
            len = length(row)
            source = parse(Int8, row[len - 5])
            amount = len > 18 ? parse(Int8, row[6:7]) : parse(Int8, row[6])
            target = parse(Int8, row[end])
            tempHolder = []
            for _ in 1:amount
                if(isempty(STACKS[source]))
                    break
                end
                push!(tempHolder, popfirst!(STACKS[source]))
            end
            for i in eachindex(tempHolder)
                pushfirst!(STACKS[target], pop!(tempHolder))
            end
        end
    end
    if printout
        for i in eachindex(STACKS)
            if(isempty(STACKS[i]))
                println("Stack $i is empty!")
            else
                val = popfirst!(STACKS[i])
                println("Stack $i has as top crate $val")
            end
        end
    end
end

function day5Part2SolveTask()
    day5Part2SolveTask(false)
end

function day5Part2SolveTask(bench)
    input = readlines("input.csv")
    if bench
        @benchmark solvePart2($input, false)
    else
        solvePart2(input, true)
    end    
end

