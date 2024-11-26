
CREATE FUNCTION GetBonus(@Salary decimal(10,2),@PerfermanceRate decimal(10,2))
returns decimal 

	as 
	begin 
		--declare @Bonus decimal ; 

		if(@PerfermanceRate >= 90) 
			return @Salary *1.3; 

		if(@PerfermanceRate >50 and @PerfermanceRate< 89) 
			return  @Salary *1.1;

		return @Salary; 
		

	end 






	select *, dbo.GetBonus(Salary,E.PerformanceRating) As Bonus
	 from Employees2 E

	 