# # ImageInspector

# ImageInspector is a small package for educational purposes. Its main goal is not presenting functionality, but presenting package structure. This is its short documentation created in the package [Literate](https://fredrikekre.github.io/Literate.jl/v2) which uses the [Markdown](https://www.markdownguide.org/cheat-sheet) syntax.

# To use the package, we need to load first the required packages.

using ImageInspector
using Plots

# ## Grayscale images

# As a test example, we create the real matrix `img1` representing a circle. We first discretize the domain $[-1,1]$ in `xs`. We assign black colour whenever $x^2 + y^2 \le 1$. Since the white colour is represented by `[1; 1; 1]` and the black colour by `[0; 0; 0]`, we can do it by the following code:

xs = -1:0.001:1
img1 = [x^2+y^2>1 for x in xs, y in xs];

# This is a two-dimensional matrix, which represents a grayscale image. We convert it to an image by calling `image` and then we plot it.

plot(image(img1); axis = nothing, border = :none)

# We can convert it to a three-dimensinal representation by the `reshape` function. The resulting plot is the same even though a different method for the `image` function is called. 

img2 = reshape(img1, (size(img1)..., 1))

plot(image(img2); axis = nothing, border = :none)

# ## Coloured images

# We can repeat a similar procedure for coloured images. We create again a three-dimensional matrix, convert it to an image and then plot it. 

img2 = ones(size(img1)..., 3)
img2[:,:,2:3] .= [x^2+y^2>1 for x in xs, y in xs]

plot(image(img2); axis = nothing, border = :none)

