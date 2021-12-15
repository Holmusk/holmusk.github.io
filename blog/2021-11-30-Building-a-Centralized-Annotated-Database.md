---
title: Building a Centralized Annotated Database
author: Punya Modi
description: What is the need to create a centralized annotated database? What advantages can it pose?
tags: Machine Learning =
---

# **Value of Creating a Standardized Annotated Database**

As I was learning about ML and getting introduced to the world of Machine Learning one of the more memorable statements I heard was that “Machine Learning is, after all, data driven AI, and your model will be only as good or as bad as the data you have”. ML depends heavily on data, without data, it is impossible for an “AI” to learn. It is the most crucial aspect that makes algorithm training possible… No matter how great the AI team is or the size of the data set, if your data set is not good enough, the entire project will fail. While gathering a sizable amount of data is important, it is only the first step of the entire process, every project requires a sizable amount of time and effort to restructure the data and classify and label it. This is especially true for datasets used to present a realistic vision of our world. With the need for data so clear, the need arises for a mechanism to store all of this data in a fashion that doesn't compromise on the  work that was already done to tailor the data to the needs of the project.


# FoodDX

FoodDX is a product from Holmusk that is meant to transform the way consumers think and feel about food, it gives real-time feedback on your meals, FoodDX allows users to upload photos of their meal for real-time nutrition scores and food tips. This is enabled via AI food scoring that leverages the companies real world dataset of over 10,000 + images.

This was made possible by one of Holmusks previous products Glycoleap which was a product that aimed at helping diabetic patients track their diet and manage their health by letting them get an expert nutritionists advice simply by clicking a photo, and the uploading it to the app, which the nutritionists then graded. The data from this gave us a great boost for FoodDX as it enables us to have access to trusted, high quality data stored in a database. We used this initial data to have in order to train the model, but we also added in completely different data separate from the initial Glycoleap data for the cross verification data, however this was mostly manages via Dropbox where the coaches were given images via Dropbox and similarly shared their scores on the same platform. When FoodDX was up and running, in order to better organize the system, the model rating and all relevant information was stored in a database and similarly, an annotation platform was created for the coaches via retool to accurately score the image, the food type, and also help with maintaining the data, as the coach data was saved in a separate datatable.

In the current existing situation, we have a plethora of sources as summarized in the flow diagram below  -

![](/images/blogposts/ML_datapipeline_sources.png)


Considering the different sources that we have, we decided to classify the sources into two types -

1. **Static Sources** - These are sources that are no longer being continuously updated. Since they would no longer be any change to these sources, we decided the data from these sources  needed a one time transfer to the new  database

2. **Active Sources** - These were sources are continuously updated, since these sources will continuously produce new data, we decided the there needs to be an established mechanism to allow for the transfer of data from these sources periodically  


# How to Design a Database that meets the requirements

A good database design process is governed by specific rules. The first rule in creating a database design is to avoid data redundancy. It wastes space and increases the probability of faults and discrepancies within the database. The second rule is that the accuracy and comprehensiveness of information are imperative. A database containing erroneous information will lead to inaccurate analysis. Consequently, it can mislead decision-makers and adversely affect performance.

While creating the Database it is necessary to keep in mind the needs of the team using the database, rather than trying to include every bit of data, it is more important to include only the relevant data necessary.







# How to Set up the Database from existing data from previous static sources and new continuing sources
Considering the fact that we have two very different type of data sources, it is important we have different approaches to syncing data form the different sources -

1. **Static sources** - As mentioned above a static source does not have any new data flowing in and this allows us more freedom in porting the data from these sources. However the most important factor with respect to static sources are often in a different format wrt to the required format of the new database. Hence with static sources, it is often considered a priority to have a methodology to port this data while also reformatting it to match the format of the new database. For FoodDX the main static source of data was considered to be Glycoleap, In order to port the Glycoleap data we decided to create a lambda that reads the Glycoleap data, reformats it and then adds it to the new database.

2. **Active Sources** - As mentioned above an active source continuously has data coming in, due to this fact the main point of dealing with active sources is to ensure that we have a periodic, seamless transfer of data. To add onto this with most active sources it is necessary to differentiate new data that come in between two subsequent syncing cycles as it is unfeasible to transfer all the data from an active source every period as it wastes a lot of resources. For FoodDX the active source was the FoodDX app that continuously gave us new images, and these new images and the relevant information will be stored in a table, while the coach information, created using the retool dashboard will be set up in another table. To combat this we set up a Postgres trigger on the table with the coach rating that will run a join function and hence granting us a new table consisting all the food entries that have a coach rating. With this we plan to using Amazon Database Migration Service to allow for the transfer of this table to the required location of the new database   


# Conclusion
The value of creating a centralized annotated database for any project especially for a Machine learning project cannot be understated. It can help streamline work while also allowing the project team to provision for the future. While creating a centralized pipeline is important, we also need to transfer all the existing data into the new pipeline.  
