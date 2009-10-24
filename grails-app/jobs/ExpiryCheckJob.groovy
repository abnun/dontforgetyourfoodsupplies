import name.markus_mueller.dontforgetyourfoodsupplies.Supply
import name.markus_mueller.dontforgetyourfoodsupplies.Paket
import name.markus_mueller.dontforgetyourfoodsupplies.FixFuer
import name.markus_mueller.dontforgetyourfoodsupplies.Suessie

class ExpiryCheckJob
{
	static triggers =
	{
		cron(name: 'expiryCheck', startDelay: 10000, cronExpression: '0 0 0 * * ?')
		//simple(name:'expiryCheck', startDelay: 10000, repeatInterval: 5000l)
	}
	// execute job once in 5 seconds

	def mailService
	def messageSource

	def execute()
	{
		// execute task
		List allSupplies = Supply.list().asList()

		ArrayList expiredSupplies = new ArrayList()

		allSupplies.findAll
		{
			Supply supply ->

			if (supply instanceof FixFuer || supply instanceof Suessie)
			{
				if (new Date().after(supply.haltbarBis))
				{
					expiredSupplies.add(supply.name)
				}
			}
		}

		if (!expiredSupplies.isEmpty())
		{
			Locale locale = Locale.getDefault()

			mailService.sendMail
			{
				to("markus.mu@web.de") // "fred@g2one.com", "ginger@g2one.com"
				from("dontforgetyourfoodsupplies@webmpuls.de") // "john@g2one.com"
				//				cc "marge@g2one.com", "ed@g2one.com"
				//				bcc "joe@g2one.com"
				subject(messageSource.resolveCodeWithoutArguments('mail.subject', locale)) // "Hello John"
				body(messageSource.resolveCode('mail.body', locale).format([expiredSupplies.toString()] as String[])) // 'this is some text'
			}
		}
	}
}
