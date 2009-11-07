package de.webmpuls.dontforgetyourfoodsupplies

import de.webmpuls.dontforgetyourfoodsupplies.Supply
import de.webmpuls.dontforgetyourfoodsupplies.Paket
import de.webmpuls.dontforgetyourfoodsupplies.FixFuer
import de.webmpuls.dontforgetyourfoodsupplies.Suessie

class ExpiryCheckJob
{
	ExpiryService expiryService
	static triggers =
	{
		cron(name: 'expiryCheck', startDelay: 10000, cronExpression: '0 0 0 * * ?')
		//simple(name:'expiryCheck', startDelay: 10000, repeatInterval: 5000l)
	}

	def execute()
	{
		// execute task
		expiryService.checkExpiryDates()
	}
}
