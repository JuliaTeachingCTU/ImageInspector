module PlotsExt

using Plots
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

function ImageInspector.imageplot(
    x::AbstractMatrix{<:Color};
    legend=false,
    axis=nothing,
    border=:none,
    kwargs...
)
    return Plots.plot(x; legend, axis, border, kwargs...)
end

end