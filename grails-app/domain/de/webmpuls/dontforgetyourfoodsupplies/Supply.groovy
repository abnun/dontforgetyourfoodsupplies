package de.webmpuls.dontforgetyourfoodsupplies

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
	Boolean expired = false

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
