package de.webmpuls.dontforgetyourfoodsupplies

class ExpiryController
{
    def index =
	{
		Collection expiredSupplies = Supply.findAllWhere(expired: true)
		return [expiredSupplies: expiredSupplies]
	}
}
