```
the Dual Type
```
using ForwardDiff
using ReadOnlyArrays # use Readonly or immutable

immutable Partials{N,T}
    values::NTuple{N,T}

end

# Type definition of a Dual Number
immutable Dual{N,T<:Real}  <: Real

    value::T
    partials :: Partials{N,T}

end

a
