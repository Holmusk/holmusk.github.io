---
title: Building a Centralized Annotated Database
author: Punya Modi
description: (tba)
tags: (tba)
---

# **Value of Creating a Standardized Annotated Database**

As I was learning about ML and getting introduced to the world of Machine Learning one of the more memorable statements I heard was that “Machine Learning is, after all, data driven AI, and your model will be only as good or as bad as the data you have”. ML depends heavily on data, without data, it is impossible for an “AI” to learn. It is the most crucial aspect that makes algorithm training possible… No matter how great the AI team is or the size of the data set, if your data set is not good enough, the entire project will fail. While gathering a sizable amount of data is important, it is only the first step of the entire process, every project requires a sizable amount of time and effort to restructure the data and classify and label it. This is especially true for datasets used to present a realistic vision of our world. With the need for data so clear, there rises a need for a mechanism to store all of this data in a fashion that doesn't compromise on the  work that has already done to tailor the data to the needs of the project


#

FoodDX is a product from Holmusk that is meant to transform the way consumers think and feel about food, it gives real-time feedback on your meals, FoodDX allows users to upload photos of their meal for real-time nutrition scores and food tips. This is enabled via AI food scoring that leverages the companies real world dataset of over 10,000 + images. This was made possible by due one of your previous products Glycoleap which was a product that aimed at helping diebatic patients track their diet and manage their health by letting them get an expert nutritionists advice simply by clicking a photo, and the uploading it to the app, which the nutritionists then graded. The data from this gave us a great boost for FoodDX as it enables us to have access to trusted, high quality data stored in a database. We used this initial data to have in order to train the model, but we also added in completely different data separate from the initial glycoleap data for the cross verification data, however this was mostly manages via dropbox where the coaches were given images via dropbox and similarly shared their scores on the same platform. When FoodDX was up and running, in order to better organize the system, the model rating and all relevant information was stored in a database and similarly, an annotation platform was created for the coaches via retool to accurately to score the image, the food type, and also help, with maintaining the data, as the coach data was saved in a separate datatable.

In the current existing situation, we have a plethora of sources as summarized in the flow diagram below  -

(image to be added)


Considering the different sources that we have, we decided to take a two prong approach, adopting different strategies for different kind of sources -

1. **Static Sources** - These were sources that no longer being continuously updated, since they would no longer be any change to these sources, we decided the data from these sources  needed a one time transfer to the new  database

2. **Active Sources** - These were sources were continuously updated, since these sources will continuously produce new data, we decided the there needs to be an established mechanism to allow for the transfer of data from these sources periodically  


# How to Design a Database that meets the requirements



> How to make a design to integrate data from various sources  





# How to Set up the Database from existing data from previous static sources and new continuing sources


# Conclusion



---

# References
