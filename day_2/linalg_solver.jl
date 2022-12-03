#A = ROCK = 1
#B = PAPER = 2
#C = SCISSORS = 3 
using BenchmarkTools


score_1((a, b)::Tuple{Int, Int}) = mod(b - a+ 1, 3) * 3 + b + 1
score_2((a, b)::Tuple{Int, Int}) = b * 3 + mod(a + b - 1, 3) + 1


function day2pt2SolveTask()
    day2pt2SolveTask(false)
end

function day2pt2SolveTask(bench)
    rows = [(line[1]-'A', line[3]-'X') for line in readlines("input.csv")]
    if bench
        println("score 1")
        @benchmark sum(score_1.($rows))
        println("score 2")
        @benchmark sum(score_2.($rows))
    else
        sol1 = sum(score_1.(rows))
        sol2 = sum(score_2.(rows))
        println("Solution 1 is $sol1")
        println("Solution 2 is $sol2")
    end
end