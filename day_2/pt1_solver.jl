#A = ROCK = X = 1
#B = PAPER = Y = 2
#C = SCISSORS = Z = 3
using BenchmarkTools

const part1playPoints = Dict([('A', 
Dict([('X', 4), ('Y', 8), ('Z', 3)])
), 
('B',
Dict([('X', 1), ('Y', 5), ('Z', 9)])
), 
('C',
Dict([('X', 7), ('Y', 2), ('Z', 6)])
)])

function d2p1parseInput(rows, printout)
    totalPoints = 0
    for row in rows
        totalPoints += part1playPoints[row[1]][row[3]]
    end
    if printout
        println("Total score would be $totalPoints")
    end
end

function day2pt1SolveTask()
    day2pt1SolveTask(false)
end

function day2pt1SolveTask(bench)
    rows = readlines("input.csv")
    if bench
        @benchmark d2p1parseInput($rows, false)
    else
        d2p1parseInput(rows, true)
    end
end