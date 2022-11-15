---
title: Building interactive data applications in NeuroBlu with Plotly Dash
author: Nithika Karthikeyan
description: Summary of how Plotly Dash was used to create the Insights Explorer feature in NeuroBlu, allowing for non-coding analysis 
tags: plotly, insights explorer, neuroBlu
---
The NeuroBlu dataset has 20+ years of longitudinal data and over 75 million rows of data, containing over 920,000 patients and more than 49 million clinical encounters across geographically diverse psychiatry sites. It is a uniquely powerful behavioral health database, but requires a certain amount of technical knowledge to access. 

Team members within Holmusk and Holmusk partners are working to democratize access to our dataset and make it easier for researchers, clinician, and clinical development managers to understand and develop evidence based insights for behavioral health data. The Insights Explorer tool addresses the evidence gap that currently limits the research, innovation, and understanding of mental and behavioral health issues. By addressing the current barrier of coding ability, all users can generate powerful insights that drive clinical and commercial success in life sciences, improving care delivery.

## Non-coding analysis

By providing an accessible and powerful explorer interface to access information relevant to specific research studies, non-coding users can quickly gain insights on data. 

Users can save time in discovery by utilizing dashboards with interactive filters and pre-defined use cases to gain insights. Without writing any lines of code, users can decide if the NeuroBlu datasets are suitable for their study, identify the right cohort inclusion/exclusion criteria for their study, and craft an appropriate research protocol for their study. 

Users can also conduct guided studies through insights explorer; generating this exploratory analysis allows for some basic studies to be performed. For example, generating a cohort comparison and effectiveness study, quantifying and demonstrating the impact of a specific drug in comparison to a competitor drug, or analyzing prescription patterns to guide the organization’s strategic business decisions.

## Overview of Plotly Dash

To take advantage of the rich Python code base our team has developed for analyzing RWE in behavioral health, we partnered with [Plotly Dash](https://dash.plotly.com) to leverage their platform to create Insights Explorer. Dash is an Open Source Python library for creating reactive, Web-based applications. It simplifies building a GUI around your data analysis code.

Dash app code is declarative and reactive, which makes it easy to build complex apps containing many interactive elements. Dash apps are built and published in the Web, and viewed in the web browser. However, you do not have to write any Javascript or HTML, as Dash provides a Python interface to a rich set of interactive web-based components.

[Dash Enterprise](https://dash.plotly.com/dash-enterprise) does not require any data to be migrated- you can directly connect to any data source from your Python code within the Dash app you are deploying on Dash Enterprise. Dash Enterprise also has an [API](https://dash.plotly.com/dash-enterprise/api) that allows you to automate many of the workflows the App Manager UI provides (commonly used for integrating Dash Enterprise with a continuous integration service such as GitLab). You can use any tool with a Python connector library to query your data from within a Dash app (SQL database, Pandas dataframe, CSV file, REST API, etc).

Embedding Plotly Dash apps allows for interactive visualizations in the NeuroBlu Research platform that can be used to view key information that helps decide the right cohort for research study.

## Insights Explorer on NeuroBlu Research

The Insights Explorer feature allows you to get quick Insights for your research study that might help you with any of the following:

1. Deciding if the datasets within NeuroBlu are right for your research study.
2. Deciding the right cohort inclusion and exclusion criteria for your research study.
3. Coming up with the research protocol for your research study.

Below is a highlight of apps developed on Plotly Dash Enterprise and embedded in NeuroBlu Research.

**Exploring a disorder group**

Under the “View Disorder Trends” tab, the user can select a dataset and disorder group to display the following information on that group:

- Number of patients diagnosed with disorder
- Demographic characteristics
    - Gender distribution
    - Age distribution
    - Race distribution
- Epidemiology and visits data
    - Incidence
    - Visit distribution
    - Outcome distribution
    - Observation distribution
    - First captured CGI-S
- Disorder trends
    - Common comorbidities
    - Most prescribed drugs
    - Number of 1 year follow ups
    - Duration of hospitalizations distribution
    - Number of hospitalizations distribution
    - Top stressors

**Comparing cohorts by drugs**

Under the “Compare Drugs” tab, the user can select a database, a category mapper diagnosis, and 2 different drugs to display the following information: 

- Number of patients in drug group 1
- Number of patients in drug group 2
- Patient group characteristics
    - Gender distribution
    - Age distribution
    - Race distribution
    - Sankey plots highlighting the following across drug groups
        - Treatment switches
        - Hospitalization results
    

## Using Plotly

- Learned how to leverage python in our own library
- Dealt with constraints with features and customizations
- Resource-intensive environment
- Some out-of-the-box components are less sophisticated than alternatives, but more extensible

## Next Steps

1. Explore the [Dashboard Engine](https://plotly.com/dash/dashboard-engine/) released in December 2021
2. Continue leveraging the multi-page applications that we are developing
3. Test database connectors to accelerate computational speed
