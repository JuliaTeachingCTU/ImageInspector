module ImageInspector

using Colors

export image

image(x::AbstractMatrix{<:Real}) = Gray.(x)

end
