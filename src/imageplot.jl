using .Plots

export imageplot

function imageplot(x, ind; nrows = -1, ncols = -1, sep = 1, kwargs...)
    return plot(imagegrid(x, ind; nrows, ncols, sep);
        legend = false,
        axis = nothing,
        border = :none,
        kwargs...
    )
end
