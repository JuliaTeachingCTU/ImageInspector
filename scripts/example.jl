using Revise # importantly, this must come before `using ImageInspector`
using ImageInspector, MLDatasets, Plots

x = MNIST.traintensor(1);
plot(
    plot(image(x; flip = true); title = "flip = true"),
    plot(image(x; flip = false); title = "flip = false");
    axis = nothing,
    border = :none,
)
