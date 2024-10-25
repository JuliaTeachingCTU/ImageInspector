<p align="center">
 <img src="https://raw.githubusercontent.com/JuliaTeachingCTU/JuliaCTUGraphics/main/logo/Julia-for-Machine-Learning-logo.svg" alt="Course logo"/>
</p>

---
# ImageInspector.jl

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/JuliaTeachingCTU/ImageInspector.jl/blob/master/LICENSE)
[![Lectures](https://img.shields.io/badge/docs-stable-blue.svg)](http://bit.ly/JuliaML)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

ImageInspector provides simple utilities to visualize image data used in machine learning.

## Instalation

The package is not registered and this can be installed in the following way

```julia
(@v1.10) pkg> add https://github.com/JuliaTeachingCTU/ImageInspector.jl
```

## Usage

The main goal of the package is to simplify the process of examining image data stored as a 3D or 4D array of numbers. This format is commonly used in machine learning, for example for training neural networks. The package consider the following assumptions about input data:

- Images are stored in the Flux style, i.e., each slice alongside the last dimension (the third or the fourth dimension) represents one image.
- Each image is stored in the **width x height** or  **width x height x color channel** format.


The core of the package is the `imageplot` function that can be used to visualize one or multiple images. However, this function the plotting backend to be loaded. The package currently support two backends: `Plots` and `Makie`.


### Plots backend

The basic usage is the following.

```julia
using ImageInspector, Plots, MLDatasets

x = CIFAR10(split=:train).features;
imageplot(x, 1:10)
```

<p align="center">
  <img src="assets/cifar.svg?raw=true">
</p>

The `imageplot` function provides several keyword arguments, that allow us to modify the resulting appearance of the image.  For example, the number of rows and columns of the resulting grid can be set by the `nrows` and `ncols` keyword arguments.

```julia
inds = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
imageplot(x, inds; nrows = 2)
```

<p align="center">
  <img src="assets/cifar_21.svg?raw=true">
</p>


### Makie backend

The usage is the same as in the case of Plots backend

```julia
using ImageInspector, CairoMakie, MLDatasets

x = CIFAR10(split=:train).features;
imageplot(x, 1:10)
```

<p align="center">
  <img src="assets/cifar_makie.svg?raw=true">
</p>

```julia
inds = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]
imageplot(x, inds; nrows = 2)
```

<p align="center">
  <img src="assets/cifar_21_makie.svg?raw=true">
</p>