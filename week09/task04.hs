{-
Create a new data type called `Point2D`
and define a function
that accepts two functions: `f` and `g` and a list of points
with two coordinates. The function should return
those points for which `f(firstCoordinate) = g(secondCoordinate)`
and should be able to work with whole
as well as floating point numbers!

**Acceptance criteria:**

1. All tests pass.
2. `Point2D` is a new data type in Haskell.
3. Create `myImagesFold` using folding.
-}

main :: IO()
main = do
    print $ myImagesFold (\x -> x * x) (2+) [Point3D 2 2 100, Point2D 1 2, Point2D 3 7] == [Point3D 2 2 100, Point2D 3 7]

data Point a = Point2D a a | Point3D a a a
 deriving (Eq)

cmp :: (Eq a) => (a -> a) -> (a -> a) -> Point a -> Bool
cmp f g (Point2D x y) = f x == g y
cmp f g (Point3D x y _) = f x == g y 

myImagesFold :: (Eq a) => (a -> a) -> (a -> a) -> [Point a] -> [Point a]
myImagesFold f g ps = foldr (\ p res -> if cmp f g p then (p:res) else res) [] ps