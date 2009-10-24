package name.markus_mueller.dontforgetyourfoodsupplies

class FixFuer extends Supply
{
	Date haltbarBis

    static constraints =
	{
		name()
		amount()
		entity(nullable: true, display: false)
		foodCategory(nullable: true, display: false)
		haltbarBis()
    }
}