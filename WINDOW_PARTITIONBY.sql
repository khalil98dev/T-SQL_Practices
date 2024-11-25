

	select *,
	DENSE_RANK() over (partition by Subject order by Grade desc) As RankGrade
	from Students ;

