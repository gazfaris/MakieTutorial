using CairoMakie



x = range(0, 10, length=100)
y = sin.(x)
lines(x, y)

using CairoMakie

x = range(0, 10, length=100)
y = sin.(x)
scatter(x,y)


#--- Multiple Plots

using CairoMakie

x = range(0, 10, length= 100)

y1= sin.(x)
y2= cos.(x)

lines(x, y1)
lines!(x,y2)

current_figure()

#--- Attributes

using CairoMakie

x = range(0, 10, length=100)

y1 = sin.(x)
y2 = cos.(x)

lines(x, y1, color = :red)

lines!(x, y2, color = :blue )

current_figure()

#=
Other plotting functions have different attributes. The function scatter, for example, does not only have the color attribute, but also a markersize attribute.
=#

using CairoMakie

x= range(0,10, length=100)
y1= sin.(x)
y2 = cos.(x)

scatter(x, y1, color = :red, markarsize =5)

scatter!(x, y2, color = :blue, markersize = 10)

current_figure()
#----
using CairoMakie

x = range(0, 10, length = 100)

y1 = sin.(x)
y2 = cos.(x)

scatter(x, y1, color = :red , markersize = 5)

sc = scatter!(x, y2, color = :blue, markersize = 10 )
sc.color = :green

sc.markersize = 20
current_figure()
