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
Makie uses a powerful layout system under the hood, which allows you to create very complex figures with many subplots. For the easiest way to do this, we need a Figure object. So far, we haven't seen this explicitly, it was created in the background in the first plotting function call.

We can also create a Figure directly and then continue working with it. We can make subplots by giving the location of the subplot in our layout grid as the first argument to our plotting function. The basic syntax for specifying the location in a figure is fig[row, col].

using CairoMakie

x = LinRange(0, 10, 100)
y = sin.(x)

fig = Figure()
lines(fig[1, 1], x, y, color = :red)
lines(fig[1, 2], x, y, color = :blue)
lines(fig[2, 1:2], x, y, color = :green)

fig
#---Each lines call creates a new axis in the position given as the first argument, that's why we use lines and not lines! here.

Constructing axes manually
Like Figures, we can also create axes manually. This is useful if we want to prepare an empty axis to then plot into it later.

The default 2D axis that we have created implicitly so far is called Axis and can also be created in a specific position in the figure by passing that position as the first argument.

For example, we can create a figure with three axes.

using CairoMakie

fig = Figure()
ax1 = Axis(fig[1, 1])
ax2 = Axis(fig[1, 2])
ax3 = Axis(fig[2, 1:2])
fig

And then we can continue to plot into these empty axes.

lines!(ax1, 0..10, sin)
lines!(ax2, 0..10, cos)
lines!(ax3, 0..10, sqrt)
fig

Note, the notation 0..10 above creates a closed interval from 0 to 10 (see IntervalSets.jl for further details).

Axes also have many attributes that you can set, for example to give them a title, or labels.

ax1.title = "sin"
ax2.title = "cos"
ax3.title = "sqrt"

ax1.ylabel = "amplitude"
ax3.ylabel = "amplitude"
ax3.xlabel = "time"
fig


Legend and Colorbar
We have seen two Layoutables so far, the Axis and the Legend which was created by the function axislegend. All Layoutables can be placed into the layout of a figure at arbitrary positions, which makes it easy to assemble complex figures.

In the same way as with the Axis before, you can also create a Legend manually and then place it freely, wherever you want, in the figure. There are multiple ways to create Legends, for one of them you pass one vector of plot objects and one vector of label strings.

You can see here that we can deconstruct the return value from the two lines calls into one newly created axis and one plot object each. We can then feed the plot objects to the legend constructor. We place the legend in the second column and across both rows, which centers it nicely next to the two axes.

using CairoMakie

fig = Figure()
ax1, l1 = lines(fig[1, 1], 0..10, sin, color = :red)
ax2, l2 = lines(fig[2, 1], 0..10, cos, color = :blue)
Legend(fig[1:2, 2], [l1, l2], ["sin", "cos"])
fig


The Colorbar works in a very similar way. We just need to pass a position in the figure to it, and one plot object. In this example, we use a heatmap.

You can see here that we split the return value of heatmap into three parts: the newly created figure, the axis and the heatmap plot object. This is useful as we can then continue with the figure fig and the heatmap hm which we need for the colorbar.

using CairoMakie

fig, ax, hm = heatmap(randn(20, 20))
Colorbar(fig[1, 2], hm)
fig


The previous short syntax is basically equivalent to this longer, manual version. You can switch between those workflows however you please.

using CairoMakie

fig = Figure()
ax = Axis(fig[1, 1])
hm = heatmap!(ax, randn(20, 20))
Colorbar(fig[1, 2], hm)
fig


Passing attributes to Figure and Axis
For one-off plots, it can be convenient to set axis or figure settings directly with the plotting command. You can do this using the plotting functions without the ! suffix, like lines or scatter, because these always create a new axis and also create a new figure if they are not plotting onto an existing one. This is explained further under Plot Method Signatures.

You can pass axis attributes under the keyword axis and figure attributes under the keyword figure.

using CairoMakie

heatmap(randn(20, 20),
    figure = (backgroundcolor = :pink,),
    axis = (aspect = 1, xlabel = "x axis", ylabel = "y axis")
)
