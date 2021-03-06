package de.webmpuls.dontforgetyourfoodsupplies

import java.text.SimpleDateFormat
import org.apache.shiro.SecurityUtils

class TimelineTagLib {

	static namespace = "wm_timeline"

	def isExpired =
	{
		attrs, body ->

		Date expiringDate = attrs['expiringDate']

		/*if(log.debugEnabled)
		{
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd.MM.yyyy")
			log.debug("expiringDate: ${simpleDateFormat.format(expiringDate)}")
		}*/

		Boolean isPaket = Boolean.valueOf(attrs['isPaket'])

		if(isPaket)
		{
			def principal = SecurityUtils.subject?.principal

			Setting setting = null

			if(principal)
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

				Integer expiringMonthsAccumulated = (expiringYears * 12) + expiringMonths

				GregorianCalendar gregorianCalendar = new GregorianCalendar()
				gregorianCalendar.setTime(expiringDate)
				gregorianCalendar.add(GregorianCalendar.MONTH, expiringMonthsAccumulated)
				/*if (log.debugEnabled)
				{
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd.MM.yyyy")
					log.debug("paket expiringDate: ${simpleDateFormat.format(gregorianCalendar.getTime())}")
				}*/
				if (new Date().after(gregorianCalendar.getTime()))
				{
					out << "<span style=\"color: red;\">${body()}</span>"

					return out
				}
			}
		}
		else if(expiringDate && (new Date().after(expiringDate)))
		{
			out << "<span style=\"color: red;\">${body()}</span>"

			return out
		}

		out << body()
		return out
	}
}
