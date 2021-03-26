using ImageInspector
using ImageInspector.Colors
using Test

@testset "ImageInspector.jl" begin
    x1 = [0.1 0.2]
    x2 = [0.1 0.2; 0.3 0.4]
    x3 = [0.1 0.2 0.3; 0.4 0.5 0.6]
    x4 = [0.1 0.2; 0.3 0.4; 0.5 0.6]
    x5 = [0.1, 0.2]

    @testset "size(x) = $(size(x))" for x in [x1, x2, x3, x4]
        img = Gray.(x);
        img_flipped = Gray.(x');
        @test image(x) == img_flipped
        @test image(x; flip = false) == img
        @test image(x; flip = true) == img_flipped
    end

    @test_throws MethodError image(x5)
end
