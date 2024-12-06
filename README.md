# Racket
### [Racket download link](https://download.racket-lang.org/)
### [Racket documentation](https://docs.racket-lang.org/racket-cheat/index.html)

# Haskell
### [Haskell/Applicative functors](https://en.wikibooks.org/wiki/Haskell/Applicative_functors)
## Functor
```haskell
class Functor f where
    fmap :: (a -> b) -> f a -> f b
```
### Must be true
```haskell
fmap id = id                   -- 1st functor law
fmap (g . f) = fmap g . fmap f -- 2nd functor law
```
## Applicative
```haskell
class Functor f => Applicative f where
  pure :: a -> f a
  (<*>) :: f (a -> b) -> f a -> f b
  GHC.Base.liftA2 :: (a -> b -> c) -> f a -> f b -> f c
  (*>) :: f a -> f b -> f b
  (<*) :: f a -> f b -> f a
  {-# MINIMAL pure, ((<*>) | liftA2) #-}
```
### Must be true
```haskell
pure id <*> v = v                            -- Identity
pure f <*> pure x = pure (f x)               -- Homomorphism
u <*> pure y = pure ($ y) <*> u              -- Interchange
pure (.) <*> u <*> v <*> w = u <*> (v <*> w) -- Composition
```