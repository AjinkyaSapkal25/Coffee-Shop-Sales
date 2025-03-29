

# Coffee Shop Sales

### Dashboard Link : https://app.powerbi.com/groups/me/reports/d9254cac-2fa7-4c54-800b-c9ffc8607080/5d252a56de249cd66d55?experience=power-bi

## Description

This dashboard helps the Stakeholders understand their customers better. It helps the Stakeholders know if their customers are satisfied with their services. 

"Coffee Shop Sales" is basically done using two tools "Power Bi" for visualization and cleaning purpose and "MYSQL" for accurate understanding of sales performance.

It basically allow users to explore sales trends, identify best and worst-selling products, and monitoring key performance indicators (KPIs) such as total sales, total orders, total quantity sold.

"Coffee Shop Sales" Dashboard had basically apply month wise filter so that it will gives us helpful insight for every month, weekday and hours.

The project aims to construct an actionable insights into various aspects of sales performance, including total sales, order analysis, sales trends by time and location, and product performance.


## Problem Statement

- Total sales analysis  
- Total order analysis  
- Total quantity sold analysis  
- Sales analysis by weekdays and weekends  
- Sales analysis by store location  
- Daily sales with average line  
- Sales analysis by product category  
- Top 10 products by sales  
- Sales analysis by days and hours  

### About Dataset:-

- "Coffee Shop Sales" is having the details of transaction id, transaction date, transaction time, quantity, store id, store location, unit price, product id, product category, product type, product details.

- It basically shows at what time transaction is done, at which store and location, unit price of the product that is purchased, quantity that is ordered by the customers and other detail about the product.

## Tools Used :-

MySQL: For storing and querying sales data. 

Power BI: For data visualization and exploratory data analysis (EDA).

# Snapshot of Dashboard (Power BI Desktop)


![Image](https://github.com/user-attachments/assets/c41f44a2-832b-4820-90e6-daf67f0e5c4c)  


## MySql & DAX

- Utilized MySql and DAX to make measures and calculations for Total sales, Total orders, Total quantity sold, Sales analysis by weekdays and weekends, Sales analysis by store location, Daily sales with average line, Sales analysis by product category, Sales analysis by days and hours.

- MySql is used for proper and accurate understanding of sales analysis to ensure its correct answers of some business problems.
 
# Visualization Used in Power BI

A single page report was created on Power BI Desktop & it was then published to Power BI Service.

Following inferences can be drawn from the dashboard;

### [1] Total Sales Analysis
Card and line chart to visualize total sales over different time periods.

                Total sales around 699k

###

### [2] Total Order Analysis
Card and line chart to show the number of orders over different time periods

   
                Total Order around 149116

###

### [3]Total Quantity Sold Analysis 
Card and line chart to display the total quantity of products sold.

                Total Quantity sold around 214470

###

### [4] Sales Analysis by Weekdays and Weekends

Donut chart is used to show the sales between "WEEKDAYS" and "WEEKEND".

                Sum of sales of "WEEKDAYS" are about 72.06% and Sum of sales of "WEEKEND" are about 27.94%.

###
  
### [5] Sales Analysis by Store Location.

Clustered Bar Chart is used to show the sales performance by location.

                "Hell's kitchen" is having highest sales and "Lower manhattan" is having less sales.

  
###

### [6] Daily Sales with Average Line.

Stacked Column Chart with an average line is used to show daily sales in coffee shop.

                Average sales is about $3861 for the month of Jan,Feb,Mar,Apr,May,June. 

        
###

### [7] Sales Analysis by Product Category.

Bar chart is used to display sales distribution across different product categories

                Thus, "Coffee" is having highest sale and "Packaged Chocolate" is having less sale.


###


 ### [8] Top 10 Products by Sales

Bar charts is used to highlight the top 10 products based on sales.


                product_type	            Total Sales

                Barista Espresso            $91406
                Brewed Chai tea	            $77082
                Hot chocolate	              $72416
                Gourmet brewed coffee	      $70035
                Brewed Black tea            $47932
                Brewed herbal tea           $47540
                Premium brewed coffee       $38781
                Organic brewed coffee       $37747
                Scone	                      $36866
                Drip coffee                 $31984

         
                Thus, "Barista Espresso" is the highest selling product in the Coffee Shop.

###

 
 ### [9] Sales Analysis by Days and Hours

Matrix chart to analyze sales performance across different days and hours.
 
                Thus, At morning 7 to 10 AM the sales at coffee shop is much higher for every day.



###

 
  ### [10]Calendar map for monthly and daywise

Matrix chart used to filter analysis based on month and day

Can be filter through every day in the month to know the sales aat coffe shop.

###
 

 ### [11] Tooltip in calender map and days & hours chart Implemented tooltip for the calendar map and matrix chart to display detailed information when hovering over each day and hour for analysis. 

###

## Conclusion

The Coffee Shop Sales Analysis dashboard provides valuable insights to increase sales performance of the coffee shop. By understanding key metrics, trends, patterns and important insights so that the company can make data-driven decisions to enhance sales strategies, improve product offerings,as well as growth of coffee shop and optimize overall performance.
###



# Thank You.
