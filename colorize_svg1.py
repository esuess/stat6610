import csv
from bs4 import BeautifulSoup
 
# Read in unemployment rates
reader = csv.reader(open('unemployment-aug2010.txt', 'r'), delimiter=",")

# Load the SVG map
svg = open('counties.svg', 'r').read()

unemployment = {}
rates_only = [] # To calculate quartiles
min_value = 100; max_value = 0; past_header = False
for row in reader:
    if not past_header:
        past_header = True
        continue
    
    try:
        full_fips = row[1] + row[2]
        rate = float( row[5].strip() )
        unemployment[full_fips] = rate
        rates_only.append(rate)
    except:
        pass

# Quartiles 
rates_only.sort()
q1_index = int( 0.25 * len(rates_only) )
q1 = rates_only[q1_index]

q2_index = int( 0.5 * len(rates_only) )
q2 = rates_only[q2_index]

q3_index = int( 0.75 * len(rates_only) )
q3 = rates_only[q3_index]
 
# Load into Beautiful Soup
# soup = BeautifulSoup(svg, selfClosingTags=['defs','sodipodi:namedview'])
soup = BeautifulSoup(svg)

 
 
# Find counties
paths = soup.findAll('path')
 
# Map colors
colors = ["#F1EEF6", "#D4B9DA", "#C994C7", "#DF65B0", "#DD1C77", "#980043"]     # Red-purple
# colors = ["#eff3ff", "#C6DBEF", "#9ECAE1", "#6BAED6", "#3182BD", "#08519C"]     # Blue
# colors = ["#f2f0f7", "#cbc9e2", "#9e9ac8", "#6a51a3"]                           # Purple
 
# County style
path_style = 'font-size:12px;fill-rule:nonzero;stroke:#FFFFFF;stroke-opacity:1;stroke-width:0.1;stroke-miterlimit:4;stroke-dasharray:none;stroke-linecap:butt;marker-start:none;stroke-linejoin:bevel;fill:'


# Color the counties based on unemployment rate
for p in paths:
 
    if p['id'] not in ["State_Lines", "separator"]:
        # pass
        try:
            rate = unemployment[p['id']]
        except:
            continue

        # Linear scale
        if rate > 10:
            color_class = 5
        elif rate > 8:
            color_class = 4
        elif rate > 6:
            color_class = 3
        elif rate > 4:
            color_class = 2
        elif rate > 2:
            color_class = 1
        else:
            color_class = 0
 
        # Quantile scale
        # if rate > 10.8:
        #     color_class = 3
        # elif rate > 8.7:
        #     color_class = 2
        # elif rate > 6.9:
        #     color_class = 1
        # else:
        #     color_class = 0
 
        color = colors[color_class]
        p['style'] = path_style + color
 
print soup.prettify()
