package de.webmpuls.dontforgetyourfoodsupplies

import de.webmpuls.dontforgetyourfoodsupplies.user.ShiroUser

class Setting
{

	ShiroUser user

	Integer expiringYears = 1
	Integer expiringMonths = 0

    static constraints =
	{
    }
}
