use ola;


create view successful_Bookings as
select * from bookings
where Booking_Status = 'Success';
#1. Retrieve all Successful bookings:
select * from Successful_Bookings;

#2. Find the average ride distance for each vehicle type:

Create View ride_distance_for_each_vehicle as
Select Vehicle_Type , AVG(Ride_Distance)
as avg_distance from bookings
Group By Vehicle_Type;

Select * from ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers
create View canceled_rides_by_customers as

select count(*) from bookings 
where Booking_Status = 'Canceled by Customer';

select * from canceled_rides_by_customers;

#4 List the top 5 customers who booked the highest number of rides:
create View top_5_customers as

Select Customer_ID, Count(Booking_ID) as total_rides
From bookings
Group by Customer_ID
Order by total_rides Desc Limit 5;

select * from top_5_customers;

#5 . Get the number of rides cancelled by drivers due to 
#personal and car-related issues:
Create View canceled_by_drivers As

SELECT count(*) from bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from canceled_by_drivers;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_and_Min_driver_ratings as

Select MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
from bookings where Vehicle_Type = 'Prime Sedan';

select * from Max_and_Min_driver_ratings;

#7. Retrieve all rides where payment was made using UPI:
create View Payment_Through_UPI as

select * from bookings where Payment_Method = 'UPI';

select * from Payment_Through_UPI; 

#8. Find the average customer rating per vehicle type:
Create View  AVG_Customer_rating as

Select Vehicle_Type, AVG(Customer_Rating) as Avg_rating from bookings
GROUP by Vehicle_Type;

Select * from AVG_Customer_rating;

#9. Calculate the total booking value of rides completed successfully:
Create View Total_Booking_value as

Select SUM(Booking_Value) as Successful_Rides_Value
from bookings
where Booking_Status = 'Success';

Select * from Total_Booking_value;

#10. List all incomplete rides along with the reason:
Create View Incomplete_rides_reason as

Select Booking_ID, Incomplete_Rides_Reason
From bookings
Where INcomplete_Rides = 'Yes';

Select * from Incomplete_rides_reason







