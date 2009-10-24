package name.markus_mueller.dontforgetyourfoodsupplies

class Supply
{
	static searchable = {
		mapping
		{
			spellCheck("include")
		}
		[only: 'name']
	}
	
	String name
	Double amount = 1
	Entity entity
	FoodCategory foodCategory

    static constraints =
	{
		name()
		amount()
		entity(nullable: true)
		foodCategory(nullable: true)
    }

	public String toString()
	{
		return name
	}
}
