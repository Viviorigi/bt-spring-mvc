# E-commerce Shoe Website

This is a **Spring MVC** project for an e-commerce platform focused on selling shoes. The platform allows sellers to manage their products and orders, while customers can browse, select, and purchase their desired products.  

---

## Features

### Customer Features
- View products by category and price, with pagination support.
- View detailed product information.
- Manage a shopping cart (add, update, delete items).
- Place orders and view order history.
- Register, log in, and log out.
- Manage customer profile information.

### Admin Features
- Manage products, categories, and orders.
- View and update order statuses.
- Role-based access control (admin and customer roles).

---

## Tech Stack

- **Backend Framework:** Spring MVC
- **Frontend:** Thymeleaf, Bootstrap
- **Database:** MySQL
- **Build Tool:** Maven

---

## Prerequisites

Before running this project, ensure you have the following installed:

- Java 17 or higher
- Maven 3.8 or higher
- MySQL 8.0 or higher

---

## Installation and Setup

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Viviorigi/bt-spring-mvc.git
   cd bt-spring-mvc

Create a MySQL database named ecommerce_shoes.
Update the application.properties file with your database credentials:

properties
spring.datasource.url=jdbc:mysql://localhost:3306/ecommerce_shoes
spring.datasource.username=your_username
spring.datasource.password=your_password

mvn clean install

mvn spring-boot:run
