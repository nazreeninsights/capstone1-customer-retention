CREATE DATABASE capstone;

USE CAPSTONE;

# 1. Customers Table
CREATE TABLE Customers (
    CustomerID VARCHAR(255) PRIMARY KEY,
    Name_ VARCHAR(255),
    Gender VARCHAR(255),
    Age INT,
    Region VARCHAR(255),
    SignupDate DATE,
    LoyaltyScore INT
);

# 2. Products Table
CREATE TABLE Products (
    ProductID VARCHAR(255) PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(255),
    Price DECIMAL(10, 2),
    Supplier VARCHAR(255)
);

# 3. Campaigns Table
CREATE TABLE Campaigns (
    CampaignID VARCHAR(255) PRIMARY KEY,
    Channel_ VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    TargetAudience INT,
    Conversions INT
);

# 4. Transactions Table
CREATE TABLE Transactions (
    TransactionID VARCHAR(255) PRIMARY KEY,
    CustomerID VARCHAR(255),
    ProductID VARCHAR(255),
    Quantity INT,
    DiscountRate DECIMAL(10, 2),
    TotalPrice DECIMAL(10, 2),
    TransactionDate DATE
    );
