using ImageInspector, CairoMakie, MLDatasets

x = CIFAR10(split=:train).features;
imageplot(x, 1:10)

inds = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
imageplot(x, inds; nrows=2)