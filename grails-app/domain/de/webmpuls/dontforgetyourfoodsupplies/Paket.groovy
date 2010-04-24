package de.webmpuls.dontforgetyourfoodsupplies

class Paket extends Supply
{
	Date eingefrorenAm

	static mapping =
	{
		sort eingefrorenAm: "asc"
	}

    static constraints =
	{
		name()
		amount()
		entity()
		foodCategory()
		eingefrorenAm()
    }
}
