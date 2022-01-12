using CairoMakie  #imports Makie  (w/ different plot functions )


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

#--- Array Attributes

"""

A lot of attributes can be set to either a single value or an array with as many elements as there are data points. For example, it is usually much more performant to draw many points with one scatter object, than to create many scatter objects with one point each.

Here are the two scatter plots again, but one has varying markersize, and the other varying color.


"""
using CairoMakie

x = range(0, 10, length = 100)
y1 = sin.(x)
y2 = cos.(x)
scatter(x, y1, color = :red, markersize = range(5, 15, length=100))
sc = scatter!(x, y2, color = range(0, 1, length=100), colormap = :thermal)

current_figure()

"""
Note that the color array does not actually contain colors,
 rather the numerical values are mapped to the plot's colormap.
 There are many different colormaps to choose from, take a look on the Colors page.

The values are mapped to colors via the colorrange attribute,
which by default goes from the minimum to the maximum color value,
 but we can also limit or expand the range manually.
 For example, we can constrain the previous scatter plot's color range to
 (0.25, 0.75), which will clip the colors at the bottom and the top quarters.
"""

sc.colorrange = (0.25, 0.75)

current_figure()
"""

Of course you can also use an array of colors directly, in which case the colorrange is ignored:
"""

using CairoMakie

x = range(0, 10, length=100)
y = sin.(x)

colors = repeat([:crimson, :dodgerblue, :slateblue1, :sienna1, :orchid1], 20)

scatter(x, y, color = colors, markersize = 20)

#--- Simple legend
If you add label attributes to your plots, you can call the axislegend function to add a legend with all labeled plots to the current axis.

using CairoMakie

x = range(0, 10, length=100)
y1 = sin.(x)
y2 = cos.(x)

lines(x, y1, color = :red, label = "sin")
lines!(x, y2, color = :blue, label = "cos")
axislegend()
current_figure()

#---Subplots
include("legend.jl");
#------ Legend
slash="//"
#include(src\legend.jl)
include("legend.jl");

#import "legend.jl"
