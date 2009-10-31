package de.webmpuls.dontforgetyourfoodsupplies

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
