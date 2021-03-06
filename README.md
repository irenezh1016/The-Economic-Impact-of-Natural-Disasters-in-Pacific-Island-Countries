# The Economic Impact of Natural Disasters in Pacific Island Countries

[publication link]:(https://www.imf.org/en/Publications/WP/Issues/2018/05/10/The-Economic-Impact-of-Natural-Disasters-in-Pacific-Island-Countries-Adaptation-and-45826)

Pacific island countries are highly vulnerable to various natural disasters which are destructive, unpredictable and occur frequently. The frequency and scale of these shocks heightens the importance of medium-term economic and fiscal planning to minimize the adverse impact of disasters on economic development. This paper identifies the intensity of natural disasters for each country in the Pacific based on the distribution of damage and population affected by disasters, and estimates the impact of disasters on economic growth and international trade using a panel regression. The results show that “severe” disasters have a significant and negative impact on economic growth and lead to a deterioration of the fiscal and trade balance. We also find that the negative impact on growth is stronger for more intense disasters. Going further this paper proposes a simple and consistent method to adjust IMF staff’s economic projections and debt sustainability analysis for disaster shocks for the Pacific islands. Better incorporating the economic impact of natural disasters in the medium- and long-term economic planning would help policy makers improve fiscal policy decisions and to be better adapted and prepared for natural disasters.

**_The following sections explain the data, empirical models, and results used in this paper._**

## Part 1: Data and Natural Disaster Intensity Measure
### 1) Data
A popular database for worldwide natural disaster data is Emergency Events Database (EM-DAT), launched by Centre for Research on the Epidemiology of Disasters (CRED). [EM-DAT](https://www.emdat.be/). The database is free and open to everyone, all you need is to register an account online and then you have the full access to the database. 

EM-DAT contains essential core data on the occurrence and effects of over 22,000 mass disasters in the world from 1900 to the present day. The database is compiled from various sources, including UN agencies, non-governmental organisations, insurance companies, research institutes and press agencies. 

For a disaster to be entered into the database at least one of the following criteria must be fulfilled:
- Ten (10) or more people reported killed
- Hundred (100) or more people reported affected
- Declaration of a state of emergency
- Call for international assistance

For macroeconomic data, the main source is World Bank Open Data [WB Open Data](https://data.worldbank.org/) and the World Economic Outlook database published by the International Monetary Fund: [WEO](https://www.imf.org/external/pubs/ft/weo/2019/01/weodata/index.aspx).

The major indicators at focus are: real GDP growth, imports, exports, trade openess, inflation, population.

Based on EM-DAT data, here are some stylized effects:

 Natural Disasters in the Pacific, by country and type| Natural Disaster Occurence 
 -------------------------:|:-------------------------:
<img src = "https://user-images.githubusercontent.com/12699202/56503486-8e580e00-64e3-11e9-8674-98cffd3080e4.jpg"  width="450"> | <img src = "https://user-images.githubusercontent.com/12699202/56503485-8e580e00-64e3-11e9-8350-b5599d558195.jpg"  width= "450">


### 2) Disaster Intensity Measure
In the literature, the general assumption has been that disasters which affect more of the population also have a bigger economic impact. In line with this general assumption, the previous literature analyzing the growth impact of natural disasters constructed a measure of natural disaster intensity using information only on population affected with larger weights on death than affected (Fomby et al, 2013; IMF, 2003; Becker and Mauro, 2006).

However, in the Pacific Island countries, because of the geographical dispersion, disasters that have the most intensity or impact the most population may not cause the biggest economic damage. Different types of natural disasters influence the country’s economy and population differently. Historical data show that droughts affect more people than other types of disasters, but storms cause the most economic damage. 

Average damage per disaster, by type

<img src = "https://user-images.githubusercontent.com/12699202/56671806-41ab3900-6683-11e9-90a8-b14627570254.jpg" width = "500">

Based on the table above, droughts tend to have the most impact on population, but when measuring the damage in US dollars, storms have the most damage. To reconcile the effects of population and dollar damage, the natual disaster intensity is constructed based on both population affected and estimaged damage percentile ranks. 

## Part 2: Empirical Model

To investigate the impact of natural disasters on growth and trade, we set up the estimation as below by adopting a similar specification as Dell et al. (2012), Felbermayr and Gröschl (2014) and Loayza et al. (2012).

<img width="401" alt="Capture" src="https://user-images.githubusercontent.com/12699202/56688300-5947e900-66a6-11e9-8ac8-55bc50335f32.PNG">

where yit is log(GDP) (or log(GDP per capita), trade balance/GDP, trade balance/GDP); NDit is natural disaster dummy variable that takes 1 if damage-to-GDP is above 75th percentile, or affected people-to-total population is above 75th percentile for the case that damage data is not available;12 Xit includes various control variables such as population, inflation, trade openness, and terms of trade growth of Australia and the U.S. interacted with the trade share with these two countries to capture global trade activity closely related to the Pacific islands.13 FEi is a country fixed effect, included to take account of country-specific heterogeneity; and FEt is a year-specific fixed effect, included to consider global macroeconomic shocks. The subscripts i and t denote country and year, respectively.

## Part 3: Results

The results from the fixed effects model are presented in the left four columns of Table 4. We find that the adverse growth effect of severe natural disasters is statistically significant in most specifications.





