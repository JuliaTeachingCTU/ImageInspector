using Revise # importantly, this must come before `using ImageInspector`
using ImageInspector, MLDatasets, Plots

# gray images
x = MNIST.traintensor(1);
plot(
    plot(image(x; flip = true); title = "flip = true"),
    plot(image(x; flip = false); title = "flip = false");
    axis = nothing,
    border = :none,
)

# color images
x1 = MNIST.traintensor(1);
x2 = CIFAR10.traintensor(2);
plot(
    plot(image(x1)),
    plot(image(x2));
    axis = nothing,
    border = :none
)

# array of images
xs = MNIST.traintensor(1:10);
plot(plot.(image(xs, [1,2]))...; axis = nothing, border = :none)
