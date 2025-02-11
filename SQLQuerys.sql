
SELECT * FROM financial_loan

--1.	Total Loan Applications

SELECT COUNT(id) as Total_Loan_Applications FROM financial_loan
 
--2.	MTD Loan Applications

SELECT COUNT(id) AS MTD_Loan_Applications FROM financial_loan
WHERE MONTH(issue_date) = 12 and YEAR(issue_date) = 2021
 
--3.	PMTD Loan Applications

SELECT COUNT(id) AS PMTD_Loan_Applications FROM financial_loan
WHERE MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

--4.	Total Funded Amount

SELECT SUM(loan_amount) as Total_Funded_Amount FROM financial_loan

--5.	MonthToDate(MTD) Total Funded Amount

SELECT SUM(loan_amount) as MTD_Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

--6.	PMTD Total Funded Amount

SELECT SUM(loan_amount) as MTD_Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--7.	Total Amount Received

SELECT SUM(total_payment) as Total_Amount_Received FROM financial_loan

--8.	MTD Total Amount Received

SELECT SUM(total_payment) as MRD_Total_Amount_Received FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

--9.	PMTD Total Amount Received

SELECT SUM(total_payment) as PMRD_Total_Amount_Received FROM financial_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--10.	Average Interest Rate

SELECT AVG(int_rate) AS Average_Interest_Rate FROM financial_loan

--11.	MTD Average Interest

SELECT AVG(int_rate) AS MTD_Average_Interest_Rate FROM financial_loan
WHERE MONTH(issue_date) = 12

--12.	PMTD Average Interest

SELECT AVG(int_rate) AS PMTD_Average_Interest_Rate FROM financial_loan
WHERE MONTH(issue_date) = 11

--13.	Average DTI 

SELECT AVG(dti)*100 AS Average_DTI FROM financial_loan

--14.	MTD Average DTI 

SELECT AVG(dti)*100 AS MTD_Average_DTI FROM financial_loan
WHERE MONTH(issue_date) = 12

--15.	PMTD Average DTI 

SELECT AVG(dti)*100 AS PMTD_Average_DTI FROM financial_loan
WHERE MONTH(issue_date) = 11

--16.	Good Loan Percentage

SELECT (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)/
COUNT(id) AS Good_Loan_Percentage FROM financial_loan

--17.	Good Loan Applications

SELECT COUNT(id) AS Good_Loan_Applications FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--18.	Good Loan Funded Amount

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--19.	Good Loan Amount Received

SELECT SUM(total_payment) AS Good_Loan_Amount_Received FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--20.	Bad Loan Percentage

SELECT( COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END)*100.0)/
COUNT(id) AS Bad_Loan_Percentage FROM financial_loan

--21.	Bad Loan Applications

SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_loan
WHERE loan_status = 'Charged Off' 

--22.	Bad Loan Funded Amount

SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM financial_loan
WHERE loan_status = 'Charged Off'

--23.	Bad Loan Amount Received

SELECT SUM(total_payment) AS Bad_Loan_Amount_Received FROM financial_loan
WHERE loan_status = 'Charged Off'

--LOAN STATUS

SELECT loan_status,
		COUNT(id) AS LOAN_APPLICATIONS,
		SUM(loan_amount) AS Total_Funded_Amount ,
		SUM(total_payment) AS Total_Amount_Received,
		AVG(int_rate) AS Interest_Rate,
		AVG(dti)*100 AS DTI
FROM financial_loan
GROUP BY loan_status

SELECT loan_status,
		SUM(loan_amount) As Total_Funded_Amount,
		SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
WHERE MONTH(issue_date) = 12
GROUP BY loan_status

--BANK LOAN REPORT
--A.MONTH

SELECT 
		MONTH(issue_date) AS MONTH_NUMBER,
		DATENAME(MONTH, issue_date) AS MONTH_NAME,
		COUNT(id) AS LOAN_APPLICATIONS,
		SUM(loan_amount) AS Total_Funded_Amount ,
		SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY MONTH(issue_date) , DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

--B.	STATE

SELECT 
	address_state AS STATE,
	COUNT(id) AS LOAN_APPLICATIONS,
	SUM(loan_amount) AS Total_Funded_Amount ,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state

--C.	TERM

SELECT
	term AS TERM,
	COUNT(id) AS LOAN_APPLICATIONS,
	SUM(loan_amount) AS Total_Funded_Amount ,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY term

--D.	EMPLOYEE LENGTH

SELECT
	emp_length AS EMPLOYEE_LENGTH,
	COUNT(id) AS LOAN_APPLICATIONS,
	SUM(loan_amount) AS Total_Funded_Amount ,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY emp_length

--E.	PURPOSE

SELECT
	purpose AS PURPOSE,
	COUNT(id) AS LOAN_APPLICATIONS,
	SUM(loan_amount) AS Total_Funded_Amount ,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY purpose
ORDER BY purpose


--F.	HOME OWNERSHIP

SELECT
	home_ownership AS HOME_OWNERSHIP,
	COUNT(id) AS LOAN_APPLICATIONS,
	SUM(loan_amount) AS Total_Funded_Amount ,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership