using MLDatasets, CairoMakie
using ImageInspector

X1 = MLDatasets.FashionMNIST(Float64, :train)[:][1];
X2 = MLDatasets.CIFAR10(Float64, :train)[:][1];

# imageplot
imageplot(X2, 1:10; nrows=2, sep=1)
