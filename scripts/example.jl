using Revise # importantly, this must come before `using ImageInspector`
using ImageInspector, MLDatasets, Plots

x = MNIST.traintensor(1);
plot(image(x); axis = nothing, border = :none)
