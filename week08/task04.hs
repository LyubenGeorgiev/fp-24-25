main :: IO()
main = do
    print $ subSeq [1,2,3]

subSeq :: [a] -> [[a]]
subSeq [] = [[]]
subSeq (x:xs) = rest ++ [x:ys | ys <- rest]
    where
        rest = subSeq xs