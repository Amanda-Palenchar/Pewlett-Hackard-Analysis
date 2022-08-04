-- Deliverable 1
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

-- Need to change table name
DROP TABLE most_recent_titles;

-- Renaming table above to match challenge name
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
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

-- Deliverable 2
-- Determining eligibility for the mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO menotorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE de.to_date = ('9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
