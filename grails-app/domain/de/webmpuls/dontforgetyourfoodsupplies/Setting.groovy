package de.webmpuls.dontforgetyourfoodsupplies

import de.webmpuls.dontforgetyourfoodsupplies.user.ShiroUser

class Setting
{

	ShiroUser user

	Integer expiringYears = 12
	Integer expiringMonths = 0

    static constraints =
	{
    }
}
