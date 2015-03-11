import plotly.plotly as py
from plotly.graph_objs import *

trace1 = Bar(
    x=['giraffes', 'orangutans', 'monkeys'],
    y=[20, 14, 23],
    name='SF Zoo'
)
trace2 = Bar(
    x=['giraffes', 'orangutans', 'monkeys'],
    y=[12, 18, 29],
    name='LA Zoo'
)
data = Data([trace1, trace2])
layout = Layout(
    barmode='stack'
)
fig = Figure(data=data, layout=layout)
plot_url = py.plot(fig, filename='stacked-bar')