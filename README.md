# End-To-End-Ecommerce-Data-Analyst-Project
# 🛒 E-Commerce Data Analytics & Operations Platform

An end-to-end business intelligence and analytics pipeline designed to examine e-commerce sales performance, financial profitability, customer payment preferences, and logistics fulfillment efficiency using Python, MySQL, and Power BI.

---

## 🎯 Business Problem & Objectives
* **Data Integrity & Standardization:** Addressed raw data inconsistencies, null values, and formatting discrepancies to build a centralized, reliable source of truth.
* **Logistics & Fulfillment Optimization:** Monitored order lifecycles and delivery timelines to isolate the root causes of customer cancellations and product returns.
* **Profitability & Revenue Visibility:** Quantified net revenue performance, gross margins, and profitability across distinct product categories and payment channels.

---

## 🛠️ Technology Stack
* **Programming & Preprocessing:** Python (`Pandas`, `NumPy`, `SQLAlchemy`)
* **Source Staging:** Microsoft Excel
* **Database & Querying:** MySQL, MySQL Workbench
* **Business Intelligence:** Power BI Desktop, Power Query, DAX, TMDL (Tabular Model Definition Language)

---

## 🔄 End-to-End Technical Workflow
1. **Data Ingestion & Preparation (Python & Excel):** Processed raw datasets by executing duplicate removal, text formatting standardization, and missing value management. Engineered core operational metrics ($\text{Sales}$, $\text{Net Account}$, $\text{Profit}$) and extracted temporal features (`Order_Month`, `Order_Year`, `Weekday`).
2. **Database Management & SQL Analytics (MySQL):** Staged cleaned relational records into a MySQL database via SQLAlchemy to manage 333 transactional orders. Executed complex queries to analyze category traction, fulfillment breakdowns, and payment behavior.
3. **Data Modeling & Visualization (Power BI):** Integrated MySQL Workbench with Power BI to construct an interactive executive dashboard. Applied advanced data modeling techniques to support robust enterprise reporting.

---

## 💼 Strategic Business Impact
* **Financial Transparency:** Established comprehensive tracking of **₹3.17M+** in Net Account revenue and **₹633K+** in total profit across transactions.
* **Category Performance Alignment:** Mapped volume distributions across **Electronics** (115), **Fashion** (105), **Home** (59), and **Furniture** (54) to guide inventory planning.
* **Fulfillment Monitoring:** Analyzed baseline order execution across Delivered (85), Cancelled (89), Returned (85), and Pending (74) states to evaluate supply chain efficiency.

---

## 📊 Core Project Architecture & Insights

### 1. Data Cleaning & Feature Engineering (Python)
* Automated data validation checks, standardized text fields, and purged corrupted entries.
* Developed automated calculated fields for core financials:
  * $\text{Sales} = \text{Qty} \times \text{Unit Price}$
  * $\text{Net Account} = \text{Sales} - (\text{Sales} \times \text{Discount} / 100)$
  * $\text{Profit} = \text{Net Account} \times 0.20$
* Derived chronological and temporal attributes (`Order_Month`, `Order_Year`, `Weekday`).

### 2. Relational Database & SQL Analysis (MySQL)
* Deployed a structured SQL database schema to ingest and query 333 transactional orders.
* **Financial Metrics:** Calculated aggregate Net Account revenue of **₹3.17M+** alongside **₹633K+** in net profit.
* **Category Segmentation:** Evaluated volume trends across Electronics, Fashion, Home, and Furniture departments.
* **Fulfillment Metrics:** Audited order status distributions to isolate high-risk cancellation and return zones.

### 3. Power BI Dashboard & Advanced Modeling
* **Power Query Transformations:** 
  * *Type Casting & Structuring:* Promoted headers, enforced strict data typing (Datetimes, Decimals, Text), and filtered out invalid rows.
  * *Conditional Custom Columns:* Implemented conditional parameters to classify fulfillment efficiency metrics (e.g., "Late" vs. "On Time" delivery benchmarking).
  * *Sorting & Indexing:* Generated custom index attributes and month sequence mappings to enforce chronological integrity on visual timelines.
* **Quarterly Analysis Integration:** Configured custom quarter parameters and time intelligence measures to evaluate performance shifts across distinct operational windows (e.g., tracking order distribution volume split between Q1 at 129 orders / 46.07% and Q2 at 151 orders / 53.93%).
* **Custom DAX Measures:** Configured specialized expressions for dynamic time intelligence, delivery duration calculation, and status grouping.
* **Omnichannel Payment Tracking:** Visualized transaction adoption across major gateways (**COD**, **NetBanking**, **Wallet**, **UPI**, **Card**).
