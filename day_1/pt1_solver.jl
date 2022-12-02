using BenchmarkTools

function d1p1getLargestCaloriesAmountInInventory(lines, printSolution)
    calories = 0
    maxCalories = 0
    for row in lines
        if row == ""
            if calories > maxCalories
                maxCalories = calories
            end
            calories = 0
        else
            calories += parse(Int, row)
        end
    end
    if printSolution
        println("largest inventory has {$maxCalories} calories!")
    end
end

function day1pt1SolveTask(bench)
    rows = readlines("input.csv")
    if bench
        @benchmark d1p1getLargestCaloriesAmountInInventory($rows, false)
    else
        d1p1getLargestCaloriesAmountInInventory(rows, true)
    end
end

function day1pt1SolveTask()
    day1pt1SolveTask(false)
end
