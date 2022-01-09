-- Challenge

-- retreive data from employees and titles to create a table with employees born between 1952 and 1955 and their titles.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
	INNER JOIN titles as ti
		ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- query to show table retirement tables.
SELECT * FROM retirement_titles;


-- retreiving data from retirement_titles and filtering to get current employees only and their most recent title; sorted based on emp_no and to_date.
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no ASC, rt.to_date DESC;

-- query to show table unique_titles.
SELECT * FROM unique_titles;


-- retreiving the number of titles from unique_titles and grouping them by title and sort in descending order.
SELECT COUNT (ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

-- query to show table unique_titles.
SELECT * FROM retiring_titles;

-- Creating a list of employees eligible for potential mentorship program.
SELECT DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- query to show table mentorship_eligibility.
SELECT * FROM mentorship_eligibility;

