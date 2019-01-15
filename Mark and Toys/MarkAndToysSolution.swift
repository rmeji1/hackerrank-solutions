func maximumToys(prices: [Int], k: Int) -> Int {
    var balance = k 
    var numberOfToys = 0 
    
    let sortedPrices = quickSort(prices)
    
   for price in sortedPrices{
       balance -= price
       if balance < 0 { break }
       numberOfToys += 1
   }
    
   return numberOfToys 
}

func quickSort(_ prices:[Int]) -> [Int]{
    if prices.count < 2 { return prices }
    let pivotIndex = prices.count / 2
    let pivotValue = prices[pivotIndex]

    var leftArray = [Int]()
    var rightArray = [Int]()
    
    for k in 0..<prices.count{
        if k == pivotIndex { continue }
        
        if prices[k] < pivotValue{ leftArray.append(prices[k]) }
        else{ rightArray.append(prices[k]) }
    }
    
    return quickSort(leftArray) + [pivotValue] + quickSort(rightArray)
}
