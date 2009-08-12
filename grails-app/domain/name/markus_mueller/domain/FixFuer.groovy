package name.markus_mueller.domain

class FixFuer extends Supply
{
	Date haltbarBis

    static constraints =
	{
		name()
		amount()
		entity(nullable: true)
		foodCategory(nullable: true)
		haltbarBis()
    }
}
