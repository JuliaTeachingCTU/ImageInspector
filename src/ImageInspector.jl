module ImageInspector

using Colors

export image, imagegrid

const ImArray{T<:Real} = Union{AbstractArray{T,3}, AbstractArray{T,4}}

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

image(x::ImArray, inds) = [image(selectdim(x, ndims(x), i)) for i in inds]
image(x::ImArray, ind::Int) = image(x, [ind])[1]

function gridsize(n::Int; nrows::Int = -1, ncols::Int = - 1)
    if nrows < 1
        if ncols < 1
            nrows = round(Int, sqrt(n))
            ncols = ceil(Int, n / nrows)
        else
            nrows = ceil(Int, n / ncols)
        end
    else
        ncols = ceil(Int, n / nrows)
    end
    return nrows, ncols
end

imagegrid(x, ind::Int; kwargs...) = image(x, ind)

function imagegrid(x, inds; sep = 1, kwargs...)
    imgs = image(x, inds)
    n = length(imgs)
    nrows, ncols = gridsize(n; kwargs...)

    h, w = size(imgs[1])
    A = fill(
        eltype(imgs[1])(1), # white color in proper color type
        nrows*h + (nrows + 1)*sep, # height of the reculting image
        ncols*w + (ncols + 1)*sep, # width of the reculting image
    )

    for i in 1:nrows, j in 1:ncols
        k = j + (i - 1) * ncols
        k > n && break

        rows = (1:h) .+ (i - 1)*h .+ i*sep
        cols = (1:w) .+ (j - 1)*w .+ j*sep
        A[rows, cols] = imgs[k]
    end
    return A
end

end
