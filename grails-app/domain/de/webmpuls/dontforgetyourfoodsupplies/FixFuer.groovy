package de.webmpuls.dontforgetyourfoodsupplies

class FixFuer extends Supply
{
	Date haltbarBis

	static mapping =
	{
		sort haltbarBis: "asc"
	}

    static constraints =
	{
		name()
		amount()
		entity(nullable: true, display: false)
		foodCategory(nullable: true, display: false)
		haltbarBis()
    }
}
