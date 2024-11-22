main :: IO()
main = do
    print $ printHello " students"

printHello name = "Hello world" ++ name
