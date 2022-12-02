using BenchmarkTools

function d1p2convertToInventorys(lines, printSolution)
    topVal = 0
    medVal = 0
    lowVal = 0
    calories = 0
    for row in lines
        if row == ""
            if calories > topVal
                topVal = calories
            elseif calories > medVal
                medVal = calories
            elseif calories > lowVal
                lowVal = calories
            end
            calories = 0
        else
            calories +=  parse(Int, row)
        end
    end
    maxCalories = topVal + medVal + lowVal
    if printSolution
        println("The three inventories have a total amount of {$maxCalories} calories!")
    end
end

function day1pt2SolveTask(bench)
    rows = readlines("input.csv")
    if bench
        @benchmark d1p2convertToInventorys($rows, false)
    else
        d1p2convertToInventorys(rows, true)
    end
end

function day1pt2SolveTask()
    day1pt2SolveTask(false)
end
