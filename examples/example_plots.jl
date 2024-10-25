using MLDatasets, Plots
using ImageInspector

X1 = MLDatasets.FashionMNIST(Float64, :train)[:][1];
X2 = MLDatasets.CIFAR10(Float64, :train)[:][1];

x1 = selectdim(X1, ndims(X1), 1)
x2 = selectdim(X2, ndims(X2), 1)

# gray images
plot(
    plot(image(x1; flip=true); title="flip = true"),
    plot(image(x1; flip=false); title="flip = false");
    axis=nothing,
    border=:none
)

# color images
plot(
    plot(image(x1)),
    plot(image(x2));
    axis=nothing,
    border=:none
)

# imagegrid
plot(imagegrid(X1, 1:10; nrows=2, sep=2); axis=nothing, border=:none)

# imageplot
imageplot(X2, 1:10; nrows=2, sep=1)
