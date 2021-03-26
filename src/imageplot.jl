using .Plots

export imageplot

function imageplot(x, ind; flip = true, nrows = -1, ncols = -1, sep = 1, kwargs...)
    return plot(imagegrid(x, ind; flip, nrows, ncols, sep);
        legend = false,
        axis = nothing,
        border = :none,
        kwargs...
    )
end
