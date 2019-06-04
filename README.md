---
title: "Infectious Disease Model"
author: "Kyro Grace, Irving Angeles"
date: "5/29/2019"
output: html_document
---

# Infectious Disease Model Introduction
  - The infectious Disease Model is a dynamic systems model that looks at three state variables 
  regarding both fatal and non-fatal diseases and see hows these variables change over time. The three state variables include infection rate, susceptibility rate, and resistance/removal rate of individuals. 

# Program Justification 
  - This application allows the user to look at specific diseases that they might be studying and map the effects of that disease to this model. The infectious disease model and in turn, this application, takes into account both fatal and non-fatal diseases which means that it allows for a wide-range of diseases to be mapped out under this model. 
 
  
# Three State Variables (Program Workflow)

  - Infectives (dI/dT) →  The number of individuals at time (t) who are infected and can transmit
    the disease.
  - Susceptibility (dS/dT)→ The number of individuals at time (t) that can get infected
  - Remove/Resistant (dR/dT) → The number of individuals at time (t) who are immune to the 
    disease.
    
  - Transmission coecient (β) → describes the instantaneous rate at which the number of infected hosts increases per infected individual.
  - Resitance Rate per Infected Individual (γ) → Individuals become resistant to this disease at the constant per rate, γ. 
    
    ![Formula](Infectious Disease Model Images/Screenshot (22).png)
    
    
    
    
    
    
  ![Figure 1](Infectious Disease Model Images/Screenshot (19).png)
    
  ![Figure 2](Infectious Disease Model Images/Screenshot (20).png)
    
  ![Figure 3](Infectious Disease Model Images/Screenshot (21).png)
    
    
    
  
# Dependencies
  -User must have access to R or R studio programs.
  
  -User must have access to internet connection.
  
  - User must load the following packages: 
      1. load(shiny)
        a. Shiny is a package that allows you to make a formula interactive. 
      2. load(deSolve)
        a. deSolve is a pakcage that allows you to solve differential equations that might be in your model. 

# How to Run Program

    
# Expected Output
  - As the user changes the different parameters, the graph on the right will change. 
  - The three lines that are shown on the graph correlate to the parameters that the user can  manipulate.
  
# Authors

    Kyro Grace 
      -Associate of Science in Biology and Chemistry
      -Bachelor of Science in Biology, expected in June 2020, UCLA
    
    Irving Angeles
     -Bachelor of Science in Environmental Science expected in June 2019
    
    
# Acknowledgements

  - Dr.Emily Curd for teaching us the coding language, for giving us constant feedback for our project, and always encouranging us throughout the process.
  
  
  - Daniel Chavez for being patient with us everytime we would be stuck with our shiny app and more important with learning how to code.
  
  - Gaurav Kandlikar for checking over our shiny app R code and helping us fix some errors in the R code to allow the output of the graph to be scientifically accurate. 
  
# References
  - Stevens, H. Henry. 2009. A Primer of Ecology in R. Oxford, OH. Springer.
  
