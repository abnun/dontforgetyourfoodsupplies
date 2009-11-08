package de.webmpuls.dontforgetyourfoodsupplies

class ExpiryController
{
	ExpiryService expiryService
    def index =
	{
		Collection expiredSupplies = Supply.findAllWhere(expired: true)
		return [expiredSupplies: expiredSupplies]
	}

	def sendMail =
	{
		expiryService.checkExpiryDates()
	}
}
