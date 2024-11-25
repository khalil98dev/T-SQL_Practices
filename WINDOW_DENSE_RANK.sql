

	select *,
	DENSE_RANK() over (order by Grade desc) 
	from Students 

	order by Grade desc 