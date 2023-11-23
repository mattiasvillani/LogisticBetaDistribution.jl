# For generating the logo of the package
using Plots, Distributions, LaTeXStrings
import ColorSchemes: Paired_12; colors = Paired_12[[1,2,7,8,3,4,5,6,9,10]]

default()
gr(legend = nothing, grid = false, color = colors[2], lw = 4, legendfontsize=14,
    xtickfontsize=14, ytickfontsize=14, xguidefontsize=20, yguidefontsize=20)

# official julia colors for blue, red, green, purple 
logo_colors = ["#4063D8", "#CB3C33", "#389826", "#9558B2"]   

logistic(x) = 3/(1+exp(-5*x))
xgrid = -1:0.01:1
plot(xgrid, logistic.(xgrid), color = :black, lw = 4)
ballxpos = [-0.95, 0.75, 0.9, 0.95]
scatter!(ballxpos, logistic.(ballxpos), color = logo_colors[1:4], 
    markersize = 8, markerstrokecolor = :auto, xaxis = false, yaxis = false)
betagrid = 0:0.01:1
plot!(betagrid .- 0.19, pdf.(Beta(2,3), betagrid), lw = 4, color = logo_colors[1])
#plot!(betagrid .- 0.1, pdf.(Beta(1/2,1/2), betagrid), lw = 4, color = logo_colors[2])
plot!(betagrid, pdf.(Beta(7,2), betagrid), lw = 4, color = logo_colors[3])


savefig((@__DIR__)*"/assets/logo.png")

