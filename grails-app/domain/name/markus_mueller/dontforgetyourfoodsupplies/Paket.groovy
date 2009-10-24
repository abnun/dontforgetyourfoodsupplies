package name.markus_mueller.dontforgetyourfoodsupplies

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
