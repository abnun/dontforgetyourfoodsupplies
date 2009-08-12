package name.markus_mueller.domain

class Paket extends Supply
{
	Date eingefrorenAm

    static constraints =
	{
		name()
		amount()
		entity()
		foodCategory()
		eingefrorenAm()
    }
}
