module MakieExt

import CairoMakie
using ImageInspector
using ImageInspector.Colors

function ImageInspector.imageplot(x, ind; flip=true, nrows=-1, ncols=-1, sep=1, kwargs...)
    img = imagegrid(x, ind; flip, nrows, ncols, sep)
    return imageplot(img; kwargs...)
end

function ImageInspector.imageplot(x; flip=true, kwargs...)
    img = image(x; flip)
    return imageplot(img; kwargs...)
end

function ImageInspector.imageplot(x::AbstractMatrix{<:Color}; kwargs...)

    f, ax = CairoMakie.image(reverse(x'; dims=2); kwargs...)
    CairoMakie.hidedecorations!(ax)
    CairoMakie.hidespines!(ax)
    return f
end

end