main :: IO()
main = do
    print $ (flatten (List []) :: [Int]) == []
    print $ flatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]]) == [1,2,3,4,5]
    print $ flatten (Elem 1) == [1]

    print $ take 10 $ flatten infiniteNestedNats -- THE POWER of LAZY EVAL
    print $ printnl infiniteNestedNats 10

-- flatten :: NestedList a -> [a]
-- flatten (Elem n) = [n]
-- flatten (List elements) = concatMap flatten elements

flatten :: NestedList a -> [a]
flatten = foldr (:) []

data NestedList a = Elem a | List [NestedList a]
  deriving (Foldable, Functor)

-- ghci> :i Foldable
-- type Foldable :: (* -> *) -> Constraint
-- class Foldable t where
--   Data.Foldable.fold :: Monoid m => t m -> m
--   foldMap :: Monoid m => (a -> m) -> t a -> m
--   Data.Foldable.foldMap' :: Monoid m => (a -> m) -> t a -> m
--   foldr :: (a -> b -> b) -> b -> t a -> b
--   Data.Foldable.foldr' :: (a -> b -> b) -> b -> t a -> b
--   foldl :: (b -> a -> b) -> b -> t a -> b
--   Data.Foldable.foldl' :: (b -> a -> b) -> b -> t a -> b
--   foldr1 :: (a -> a -> a) -> t a -> a
--   foldl1 :: (a -> a -> a) -> t a -> a
--   Data.Foldable.toList :: t a -> [a]
--   null :: t a -> Bool
--   length :: t a -> Int
--   elem :: Eq a => a -> t a -> Bool
--   maximum :: Ord a => t a -> a
--   minimum :: Ord a => t a -> a
--   sum :: Num a => t a -> a
--   product :: Num a => t a -> a
--   {-# MINIMAL foldMap | foldr #-}
        -- Defined in `Data.Foldable'

-- ghci> :i Functor
-- type Functor :: (* -> *) -> Constraint
-- class Functor f where
--   fmap :: (a -> b) -> f a -> f b
--   (<$) :: a -> f b -> f a
--   {-# MINIMAL fmap #-}
        -- Defined in `GHC.Base'

-- ghci> :t (<$>)
-- (<$>) :: Functor f => (a -> b) -> f a -> f b
-- ghci> :t fmap
-- fmap :: Functor f => (a -> b) -> f a -> f b

-- <$> is just an infix fmap

infiniteNestedNats :: NestedList Int
infiniteNestedNats = List ((Elem 1) : ((+1) <$> infiniteNestedNats) : [])

printnl :: NestedList Int -> Int -> String
printnl (Elem _) 0 = "?"
printnl (List _) 0 = "[...]"
printnl (Elem x) _ = show x
printnl (List xs) depth = "[" ++ (concatMap (`printnl` (depth-1)) xs) ++ "]"