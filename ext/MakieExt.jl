module MakieExt

import CairoMakie
import ImageInspector
using ImageInspector.Colors

function ImageInspector.imageplot(x, ind; flip=true, nrows=-1, ncols=-1, sep=1, kwargs...)
    img = imagegrid(x, ind; flip, nrows, ncols, sep)
    return imageplot(img; kwargs...)
end

function ImageInspector.imageplot(x; flip=true, kwargs...)
    img = image(x; flip)
    return imageplot(img; kwargs...)
end

function ImageInspector.imageplot(
    x::AbstractMatrix{<:Color};
    kwargs...
)

    f = Figure()
    CairoMakie.image(
        f[1, 1],
        x,
        axis=(title="Default",)
    )
    return f
end

end