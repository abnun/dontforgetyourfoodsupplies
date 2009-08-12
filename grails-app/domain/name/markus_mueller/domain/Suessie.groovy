package name.markus_mueller.domain

class Suessie extends Supply
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
