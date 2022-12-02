#A = ROCK = 1
#B = PAPER = 2
#C = SCISSORS = 3 
using BenchmarkTools

const part2playPoints = Dict([('A', 
Dict([('X', 3), ('Y', 4), ('Z', 8)])
), 
('B',
Dict([('X', 1), ('Y', 5), ('Z', 9)])
), 
('C',
Dict([('X', 2), ('Y', 6), ('Z', 7)])
)])

function d2p1parseInput(rows, printout)
    totalPoints = 0
    for row in rows
        totalPoints += part2playPoints[row[1]][row[3]]
    end
    if printout
        println("Total score would be $totalPoints")
    end
end


function day2pt2SolveTask()
    day2pt2SolveTask(false)
end

function day2pt2SolveTask(bench)
    rows = readlines("input.csv")
    if bench
        @benchmark d2p1parseInput($rows, false)
    else
        d2p1parseInput(rows, true)
    end
end