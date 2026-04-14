/*
a) The information that is the actor table is information about a actor, such as first name or last name and etc..
b) The information that is under film is details about a movie sush as title, movie description, lenght or rating
c) Under film_actor it has both actor_id and film_id
d) Under rental from my best guess the information is films that were rented out by customers. But the information is a 
little hard to understand because it is not specific so that someone who didn't create this can understand easily.
e) Inventory is also hard to understand because it is not specific 
f) The data you would have to use if from the film, payment, and rental tables. All three of these tables have correlated data for us to understand 
which film was rented when and by whom and also when it should be returned. 
*/

SELECT * FROM film;
SELECT * FROM payment;
SELECT * FROM rental;