module ImageInspector

using Colors

export image

"""
    image(x::AbstractMatrix{T}; flip = true)

Converts a matrix of real numbers to the matrix of `Gray` points. If the keyword argument
`flip` is true, the resulting matrix is transposed.

# Example

```julia-repl
julia> x = [0.1 0.25; 0.4 0.6]
2×2 Array{Float64,2}:
 0.1  0.25
 0.4  0.6

julia> image(x)
2×2 Array{Gray{Float64},2} with eltype Gray{Float64}:
 Gray{Float64}(0.1)   Gray{Float64}(0.4)
 Gray{Float64}(0.25)  Gray{Float64}(0.6)

julia> image(x; flip = false)
2×2 Array{Gray{Float64},2} with eltype Gray{Float64}:
 Gray{Float64}(0.1)  Gray{Float64}(0.25)
 Gray{Float64}(0.4)  Gray{Float64}(0.6)
```
"""
function image(x::AbstractMatrix{T}; flip = true) where {T <: Real}
    xx = flip ? PermutedDimsArray(x, (2, 1)) : x
    return Gray.(xx)
end

function image(x::AbstractArray{T,3}; flip = true) where {T <: Real}
    s = size(x, 3)
    if s == 1
        return image(dropdims(x; dims = 3); flip)
    elseif s == 3
        xx = flip ? PermutedDimsArray(x, (2, 1, 3)) : x
        return RGB.(eachslice(xx; dims= 3)...)
    else
        throw(ArgumentError("unsupported size of the third dimension $(s) ∉ [1,3]."))
    end
end

end
