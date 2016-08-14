Paste your queries and results in this file
================================================================================
Release 0:

- show all the books
sqlite> SELECT * FROM books;
1|Rails 4 Test Prescriptions|1|1
2|Metaprogramming Ruby 2|2|1
3|Programming Ruby 1.9 & 2.0|3|1
4|Pragmatic Programmer|3|2
5|Practical Object Oriented Design in Ruby|4|2
6|The Rails 4 Way|5|2
7|Objective-C Programming|6|3
8|iOS Programming|6|3
9|JavaScript: The Good Parts|7|4
10|JavaScript: The Definitive Guide|8|4
11|Functional JavaScript|9|4
12|Build iOS Games with SpriteKit|10|1
13|Test iOS Apps with UI Automation|10|1
14|Design Patterns in Ruby|11|2
15|Eloquent Ruby|11|2
16|Web Design with HTML & CSS|12|5
17|JavaScript and jQuery|12|5
18|Well-Grounded Rubyist|13|6
19|Essential Algorithms|14|5
20|Introduction to Algorithms|15|7
sqlite>

Release 1:

- show all the books containing "Ruby" in the title
sqlite> SELECT * FROM books WHERE title LIKE "%Ruby%";
2|Metaprogramming Ruby 2|2|1
3|Programming Ruby 1.9 & 2.0|3|1
5|Practical Object Oriented Design in Ruby|4|2
14|Design Patterns in Ruby|11|2
15|Eloquent Ruby|11|2
18|Well-Grounded Rubyist|13|6
sqlite>

- show the authors with a name starting with "Dav"
sqlite> SELECT * FROM authors WHERE name LIKE "Dav%";
3|Dave Thomas
8|David Flanagan
13|David Black
sqlite>

Release 2:

- show all the books published by "Addison-Wesley"
sqlite> SELECT * FROM books WHERE publisher_id=2;
4|Pragmatic Programmer|3|2
5|Practical Object Oriented Design in Ruby|4|2
6|The Rails 4 Way|5|2
14|Design Patterns in Ruby|11|2
15|Eloquent Ruby|11|2
sqlite>

- show all the books authored by "Jonathan Penn"
sqlite> SELECT * FROM books WHERE author_id=10;
12|Build iOS Games with SpriteKit|10|1
13|Test iOS Apps with UI Automation|10|1
sqlite>

- show all the publishers where the book title contains "iOS"
sqlite> SELECT publishers.name, books.title FROM books LEFT JOIN publishers ON books.publisher_id = publishers.id WHERE books.title LIKE '%iOS%';

Big Nerd Ranch|iOS Programming
Pragmatic Programmers|Build iOS Games with SpriteKit
Pragmatic Programmers|Test iOS Apps with UI Automation
sqlite>


- show all the publishers for the author "Sandi Metz"
sqlite> SELECT publishers.name, authors.name FROM books
 ...>   LEFT JOIN publishers ON books.publisher_id = publishers.id
 ...>   LEFT JOIN authors ON books.author_id = authors.id
 ...>   WHERE authors.name = "Sandi Metz";
Addison-Wesley|Sandi Metz
sqlite>
