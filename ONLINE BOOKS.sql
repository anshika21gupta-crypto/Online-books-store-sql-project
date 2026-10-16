CREATE DATABASE ONLINE_BOOKS;
USE ONLINE_BOOKS;


SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 1) Retrieve all books in the "Fiction" genre:
select * from books 
where Genre = "Fiction";


-- 2) Find books published after the year 1950:
SELECT * FROM BOOKS 
WHERE PUBLISHED_YEAR > 1950;

-- 3) List all customers from the Canada:
SELECT * FROM CUSTOMERS
WHERE COUNTRY = "CANADA";

-- 4) Show orders placed in November 2023:
SELECT * FROM ORDERS
WHERE ORDER_DATE BETWEEN "2023-11-01" AND "2023-11-30";

-- 5) Retrieve the total stock of books available:
SELECT 
SUM(Stock) as total_stock
from books;

-- 6) Find the details of the most expensive book:

select * from books;
select max(price)
from books
;
select * from books
order by price desc
 limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:

select * from orders;
select * from orders 
where Quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20:
select * from orders
where Total_Amount > 20;

-- 9) List all genres available in the Books table:
select * from books;
select distinct Genre
from books;

-- 10) Find the book with the lowest stock:
select * from books 
order by stock asc;

-- 11) Calculate the total revenue generated from all orders:
select * from orders;
select sum(Total_Amount) as Total_Revenue from orders;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

select * from orders;
select * from books;
select b.genre , sum(o.quantity) as Total_no_of_books_sold
from orders o
join books b
on b.book_id = o.book_id
group by b.genre
order by b.genre desc;

-- 2) Find the average price of books in the "Fantasy" genre:
SELECT * FROM BOOKS;
SELECT GENRE, AVG(PRICE)
from books
group by genre
HAVING GENRE = "FANTASY";

SELECT AVG(PRICE)
FROM BOOKS 
WHERE GENRE = "FANTASY";



-- 3) List customers who have placed at least 2 orders:

SELECT * FROM ORDERS;
SELECT CUSTOMER_ID ,
COUNT(ORDER_ID)
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(ORDER_ID)>=2
order by count(order_id) desc;

-- 4) Find the most frequently ordered book:
select * from orders;
select b.book_id ,b.Title, count(o.order_id) as order_count
from orders o
join books b 
on o.book_id = b.book_id
group by b.
Book_id, b.Title
order by count(order_id) desc;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
select * from books;
select book_id, title ,genre, price
from books
where genre = "fantasy" 
order by price desc
limit 3;


-- 6) Retrieve the total quantity of books sold by each author:
select * from orders;
select * from books;
select distinct b.Author, sum(o.quantity) as Total_quantity
from Books b 
join orders o 
on b.book_id = o.book_id
group by b.Author
ORDER BY TOTAL_QUANTITY DESC; 

-- 7) List the cities where customers who spent over $30 are located:
SELECT * FROM BOOKS;
SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
SELECT DISTINCT c.City , o.Total_amount
from customers c 
join orders o 
on c.customer_id = o.customer_id 
where o.total_amount > 30;

-- 8) Find the customer who spent the most on orders:
SELECT c.Customer_Id, c.Name , round(SUM(o.Total_Amount),0) as Total_spent
FROM CUSTOMERS c 
join orders o 
on c.customer_id = o.customer_id 
GROUP BY c.Customer_id , c.NAME
order by Total_spent desc;

##-9) Calculate the stock remaining after fulfilling all orders:
select * from orders;
select b.Book_id ,b.Stock, coalesce(sum(o.quantity),0) as Order_Quantity, b.stock- coalesce(sum(o.quantity),0) as Remaining_quantity
from books b 
left join orders o 
on b.book_id= o.book_id 
group by b.book_id, b.stock;


