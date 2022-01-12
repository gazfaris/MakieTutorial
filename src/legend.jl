#=
Legend and Colorbar
We have seen two Layoutables so far, the Axis and the Legend which was created by the function axislegend. All Layoutables can be placed into the layout of a figure at arbitrary positions, which makes it easy to assemble complex figures.

In the same way as with the Axis before, you can also create a Legend manually and then place it freely, wherever you want, in the figure. There are multiple ways to create Legends, for one of them you pass one vector of plot objects and one vector of label strings.

You can see here that we can deconstruct the return value from the two lines calls into one newly created axis and one plot object each. We can then feed the plot objects to the legend constructor. We place the legend in the second column and across both rows, which centers it nicely next to the two axes.
""" =#
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
