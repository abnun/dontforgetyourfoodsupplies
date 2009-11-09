package de.webmpuls.dontforgetyourfoodsupplies

import java.text.SimpleDateFormat
import org.apache.shiro.SecurityUtils

class ExpiryService
{
    boolean transactional = true

	def mailService
	def messageSource

    public void checkExpiryDates()
	{
		Collection allSupplies = Supply.list()

		ArrayList expiredSupplies = new ArrayList()

		allSupplies.findAll
		{
			Supply supply ->

			if (supply instanceof FixFuer)
			{
				if (new Date().after(((FixFuer)supply).haltbarBis))
				{
					expiredSupplies.add(supply.name)
					supply.expired = true
					supply.save(flush: true)
				}
				else
				{
					supply.expired = false
					supply.save(flush: true)
				}
			}
			else if(supply instanceof Suessie)
			{
				if (new Date().after(((Suessie)supply).haltbarBis))
				{
					expiredSupplies.add(supply.name)
					supply.expired = true
					supply.save(flush: true)
				}
				else
				{
					supply.expired = false
					supply.save(flush: true)
				}
			}
			else if(supply instanceof Paket)
			{
				def principal = SecurityUtils.subject?.principal

				Setting setting = null

				if (principal)
				{
					setting = Setting.findByUser(principal)
				}
				else
				{
					setting = Setting.list().iterator().next()
				}

				if (setting)
				{
					Integer expiringYears = setting.expiringYears
					Integer expiringMonths = setting.expiringMonths

					Integer expiringMonthsAccumulated = expiringYears + expiringMonths

					GregorianCalendar gregorianCalendar = new GregorianCalendar()
					gregorianCalendar.setTime(((Paket)supply).eingefrorenAm)
					gregorianCalendar.add(GregorianCalendar.MONTH, expiringMonthsAccumulated)
					if (log.debugEnabled)
					{
						SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd.MM.yyyy")
						log.debug("paket expiringDate: ${simpleDateFormat.format(gregorianCalendar.getTime())}")
					}
					if (new Date().after(gregorianCalendar.getTime()))
					{
						expiredSupplies.add(supply.name)
						supply.expired = true
						supply.save(flush: true)
					}
					else
					{
						supply.expired = false
						supply.save(flush: true)
					}
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
