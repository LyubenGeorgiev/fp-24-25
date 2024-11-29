main :: IO()
main = do
    print $ join [[1, 2], [5, 6], [9]] == [1, 2, 5, 6, 9]
    print $ join [['H'], ['a', 's'], "kell"] == "Haskell"

    print $ joinFold [[1, 2], [5, 6], [9]] == [1, 2, 5, 6, 9]
    print $ joinFold [['H'], ['a', 's'], "kell"] == "Haskell"

join :: [[a]] -> [a]
join [] = []
join (xs:xss) = xs ++ join xss

joinFold :: [[a]] -> [a]
joinFold = foldl (++) []