---
title: Visualizing the Baby Boom
author:
- name: Kieran Healy
  affiliation: Duke University
  email: kjhealy@soc.duke.edu
date: April 2018
abstract: I provide a tiled visualization of average monthly birth rates between 1938 and 1991 for the United States and for England and Wales. Ideas about demographic “generations” such as Baby Boomers, Generation X, and Millennials are in widespread use in popular discussions of social change, often quite fancifully. The visualization makes apparent the sheer scale of the U.S. Baby Boom in comparison to other alleged generations.
bibliography: <!-- \bibliography{/Users/kjhealy/Documents/bibs/socbib-pandoc.bib} This is a hack for Emacs users so that RefTeX knows where your bibfile is, and you can use RefTeX citation completion in your .md files. -->
...


The concept of the cohort has a long history in sociology and demography [@ryder65cohorconcepstudysocialchang], and satisfactorily disentangling age, period, and cohort effects has been a persistent focus of research  [@fossengageperiodcohormodel]. Yet, for at least the past decade, popular or otherwise high-profile accounts of social change have shown little interest in this work. Instead, the idea of "generations" has become a powerful organizing trope. References to named generations and their alleged characteristics, from the "Silent" through to the as-yet uncharacterized "post-Millennial" [@dimock18defin], are by now ubiquitous. This tendency makes it easy to underestimate just how large the 1946-64 U.S. "Baby Boom" generation was in comparison to any of its generational counterparts, whether real or imagined.

![Average births per million people per day, 1938--1991. Each tile represents one month. The underlying count is number of births per month, standardized first by the total population for the period and then by the number of days in that month. Data for the United States are from the U.S. Census Bureau. Data for England and Wales are from the U.K. Office of National Statistics.](./figures/births_monthly_tile_vert.pdf)

It is worth making this point in a visually accessible way. Figure 1 takes advantage of the availability of monthly birth data for the United States and for England and Wales to present two tiled or mosaic plots of average monthly births between 1938 and 1991. While there are many points of substantive interest, we can highlight four. First, and most obviously, is the scale of the U.S. baby boom from mid-1946 to the end of 1964. It is far larger either than subsequent years in the U.S. or any period in England and Wales. Second, while England and Wales also experienced a spike in births in 1946-7, rates returned to previous levels almost immediately. (Recall that rationing continued in Britain until 1954.) England and Wales did not experience a substantial increase in birth rates until the 1960s. Third, it is also possible to see changes in birth rates during the Second World War, with the U.S. showing an increase about nine months after December 1941, and England and Wales showing a rise in the Spring of 1944. And finally, fourth, the seasonality of births by month is also evident in the graph, as is the difference in peak birth months between the U.S. and England and Wales.

Laying out the data in the tiled format used here allows for a more detailed representation of monthly changes than can be conveyed in a single line plot for a time series of this length. The palette was chosen for its perceptual uniformity, its efficient use of a wide slice of the color space, and its visibility to color-blind viewers. The plot was produced using R and ggplot [@team18r; @wickham16]. Data and code to fully reproduce the plots, together with alternative ways of visualizing the same data, and additional observations for the U.S. case, are available at <http://github.com/kjhealy/boom>.


# References


