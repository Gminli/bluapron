Consider the dataset D2.3, which contains simulated transactional data inspired by the subscription meal delivery service Blue Apron (https://www.blueapron.com). The dataset records a random sample of Blue Apron’s subscribers’ activity (∼22,400 individuals) during Jan 2019. A detailed codebook is available from the document C2.3./

Consider the following two specifications: Specification 1: **𝑦 = 𝑓(𝛽! + 𝛽” 𝑇𝑒𝑛𝑢𝑟𝑒 + 𝛽# 𝑅𝑎𝑡𝑖𝑛𝑔 + 𝛽$ 𝑃𝑎𝑟𝑡𝑦𝑆𝑖𝑧𝑒 + 𝛽% 𝑈𝑟𝑏𝑎𝑛 + (𝑃𝑙𝑎𝑛 𝑚𝑒𝑛𝑢 𝑎𝑛𝑑 𝑓𝑟𝑒𝑞𝑢𝑒𝑛𝑐𝑦 𝑓𝑎𝑐𝑡𝑜𝑟𝑠))** **Specification 2:** **𝑦 = 𝑓(𝛽! + 𝛽” 𝑇𝑒𝑛𝑢𝑟𝑒 + 𝛽# 𝑅𝑎𝑡𝑖𝑛𝑔 + 𝛽$ 𝑃𝑎𝑟𝑡𝑦𝑆𝑖𝑧𝑒 + 𝛽% 𝑈𝑟𝑏𝑎𝑛 + (𝑃𝑙𝑎𝑛 𝑚𝑒𝑛𝑢 𝑎𝑛𝑑 𝑓𝑟𝑒𝑞𝑢𝑒𝑛𝑐𝑦 𝑓𝑎𝑐𝑡𝑜𝑟𝑠) + 𝛽& 𝑅𝑎𝑡𝑖𝑛𝑔 × 𝑃𝑎𝑟𝑡𝑦𝑆𝑖𝑧𝑒 + 𝛽’ 𝑅𝑎𝑡𝑖𝑛𝑔 × 𝑈𝑟𝑏𝑎𝑛 + 𝛽( 𝑃𝑎𝑟𝑡𝑦𝑆𝑖𝑧𝑒 × 𝑈𝑟𝑏𝑎𝑛 + 𝛽) 𝑈𝑟𝑏𝑎𝑛 × 𝑇𝑒𝑛𝑢𝑟𝑒)**

Using the Blue Apron data, perform the following tasks:

Task 1:

1. Estimate the two listed specifications using churn indicator as the outcome and implementing f as the logistic model.
   
2. Select a model based on predictive performance criteria. Justify your decision.
   
3. Use the selected model to predict churn probabilities for every customer in the sample. Present a histogram of these probabilities.

Task 2:

1. Estimate the two listed models using MonthlyAddons as the outcome and implementing f as linear regression.

2. Select a model based on predictive performance criteria. Justify your decision.

3. Use the selected model to predict MonthlyAddons for every customer in the sample. Make sure these predictions are within range. Present a histogram thereof.

Task 3:

Export the full dataset to a csv file. The exported data must include individual predictions for churn probabilities (task 1) and monthly add-ons (task 2), each from their respectively preferred specification. After this file is saved as csv, convert it into xls or xlsx so that formulas can be saved (this last step is not in R, just a simple change of extension).

Task 4: consider the following policy currently being evaluated by BA’s leadership: by making a one-time 0 expenditure on each targeted customer (eg, mailing a gift Champaign bottle), BA can reduce each targeted customer’s probability of churn by 0.01.

1. Compute baseline CLV values for each customer in the initial scenario (i.e., if the new policy was not implemented).
  
2. Determine the optimal targeting policy with unlimited budget. This is, determine the set of customers who the firm should send the one-time gift to. How many customers does the firm target?
   
3. Compute the total financial gains/losses derived from implementing the campaign as the before/after difference between the total CLV values in the entire portfolio of customers. (Note: your calculations should account for targeting costs.)
