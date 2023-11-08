# Restaurant_Database_Design

This is a restaurant database design dealing with the day to day activities. The restaurant Has a booking service, where customers can book their tables beforehand and also book a certain table if they wish. Customers need to provide their full name, city and phone number. The staff checks if the customer is in the database and uses existing record.
If the customer is booking for the first time, a new record is created. When making the booking,  the date, time, number of people thst will dine in and the table number information are requested. The name of the staff who made the booking is also recorded. Each booking has a default 2-hour timeslot, which can be changed in case the customer wants to stay longer.
Upon entering the establishment, customers need to speak to a receptionist, who checks whether they already have a booking. If they do, they are taken to their table and if not, a new booking is made. 
Once settled, the customers are then  served by a staff member who takes the orders. 
The restaurant will also publish a recipe book of the different dishes that are served.

The design follows database elements; structure, indexes, queries and reports to ensure consistency of data.
The validation rules include:
	1. Staff gender should be recorded as 'M' or 'F'.
	2. Customers phone number are unique.
	3. Staff numbers are generated automatically using a sequence.
 
