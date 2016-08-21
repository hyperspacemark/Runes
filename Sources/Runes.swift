/**
map a function over a value with context

Expected function type: `(a -> b) -> f a -> f b`
Haskell `infixl 4`
*/
infix operator <^> : ComparisonPrecedence

/**
apply a function with context to a value with context

Expected function type: `f (a -> b) -> f a -> f b`
Haskell `infixl 4`
*/
infix operator <*> : ComparisonPrecedence

precedencegroup SequencePrecedence {
    associativity: left
    higherThan: ComparisonPrecedence
}

/**
sequence actions, discarding right (value of the second argument)

Expected function type: `f a -> f b -> f a`
Haskell `infixl 4`
*/
infix operator <* : SequencePrecedence

/**
sequence actions, discarding left (value of the first argument)

Expected function type: `f a -> f b -> f b`
Haskell `infixl 4`
*/
infix operator *> : SequencePrecedence

precedencegroup AssociativeBinaryPrecedence {
    associativity: left
    lowerThan: ComparisonPrecedence
}

/**
an associative binary operation

Expected function type: `f a -> f a -> f a`
Haskell `infixl 3`
*/
infix operator <|> : AssociativeBinaryPrecedence

precedencegroup FunctionMapLeftPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
    lowerThan: LogicalDisjunctionPrecedence
}

/**
map a function over a value with context and flatten the result

Expected function type: `m a -> (a -> m b) -> m b`
Haskell `infixl 1`
*/
infix operator >>- : FunctionMapLeftPrecedence

precedencegroup FunctionMapRightPrecedence {
    associativity: right
    higherThan: AssignmentPrecedence
    lowerThan: LogicalDisjunctionPrecedence
}

/**
map a function over a value with context and flatten the result

Expected function type: `(a -> m b) -> m a -> m b`
Haskell `infixr 1`
*/
infix operator -<< : FunctionMapRightPrecedence

/**
compose two functions that produce results in a context,
from left to right, returning a result in that context

Expected function type: `(a -> m b) -> (b -> m c) -> a -> m c`
Haskell `infixr 1`
*/
infix operator >-> : FunctionMapRightPrecedence

/**
compose two functions that produce results in a context,
from right to left, returning a result in that context

like `>->`, but with the arguments flipped

Expected function type: `(b -> m c) -> (a -> m b) -> a -> m c`
Haskell `infixr 1`
*/
infix operator <-< : FunctionMapRightPrecedence
