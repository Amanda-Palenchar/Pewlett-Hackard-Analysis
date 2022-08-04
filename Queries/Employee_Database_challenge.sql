-- Create initial table 
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tl.title,
	tl.from_date,
	tl.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS tl
ON (e.emp_no = tl.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO most_recent_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

-- Retrieve the number of employees by most recent job title -- accidentally made errors
SELECT COUNT (title) emp_no,
	title
INTO retiring_titles
FROM most_recent_titles
GROUP BY title
ORDER BY emp_no DESC;

DROP TABLE retiring_titles

-- Retrieve the number of employees by most recent job title
SELECT COUNT (title) emp_no,
	title
INTO retiring_titles
FROM most_recent_titles
GROUP BY title
ORDER BY emp_no DESC;
