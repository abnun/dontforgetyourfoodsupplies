package name.markus_mueller.controllers

import name.markus_mueller.domain.Paket
import name.markus_mueller.domain.ArchiveSupply

class PaketController
{

	def index =
	{
		redirect(action: list, params: params)
	}

	// the delete, save and update actions only accept POST requests
	static allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

	def list =
	{
		//params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
		[paketInstanceList: Paket.list(params), paketInstanceTotal: Paket.count()]
	}

	def show = {
		def paketInstance = Paket.get(params.id)

		if (!paketInstance)
		{
			flash.message = "Paket not found with id ${params.id}"
			redirect(action: list)
		}
		else
		{
			return [paketInstance: paketInstance]
		}
	}

	def delete =
	{
		def paketInstance = Paket.get(params.id)
		if (paketInstance)
		{
			try
			{
				paketInstance.delete()
				flash.message = "Paket ${params.id} deleted"
				redirect(action: list)
			}
			catch (org.springframework.dao.DataIntegrityViolationException e)
			{
				flash.message = "Paket ${params.id} could not be deleted"
				redirect(action: show, id: params.id)
			}
		}
		else
		{
			flash.message = "Paket not found with id ${params.id}"
			redirect(action: list)
		}
	}

	def edit =
	{
		def paketInstance = Paket.get(params.id)

		if (!paketInstance)
		{
			flash.message = "Paket not found with id ${params.id}"
			redirect(action: list)
		}
		else
		{
			return [paketInstance: paketInstance]
		}
	}

	def update = {
		def paketInstance = Paket.get(params.id)
		if (paketInstance)
		{
			if (params.version)
			{
				def version = params.version.toLong()
				if (paketInstance.version > version)
				{

					paketInstance.errors.rejectValue("version", "paket.optimistic.locking.failure", "Another user has updated this Paket while you were editing.")
					render(view: 'edit', model: [paketInstance: paketInstance])
					return
				}
			}
			paketInstance.properties = params
			if (!paketInstance.hasErrors() && paketInstance.save())
			{
				flash.message = "Paket ${params.id} updated"
				redirect(action: show, id: paketInstance.id)
			}
			else
			{
				render(view: 'edit', model: [paketInstance: paketInstance])
			}
		}
		else
		{
			flash.message = "Paket not found with id ${params.id}"
			redirect(action: edit, id: params.id)
		}
	}

	def create = {
		def paketInstance = new Paket()
		paketInstance.properties = params
		return ['paketInstance': paketInstance]
	}

	def save =
	{
		def paketInstance = new Paket(params)
		def archiveEntityInstance = new ArchiveSupply(params)

		if (!paketInstance.hasErrors() && paketInstance.save() && !archiveEntityInstance.hasErrors() && archiveEntityInstance.save())
		{
			flash.message = "Paket ${paketInstance.id} created"
			redirect(action: show, id: paketInstance.id)
		}
		else
		{
			render(view: 'create', model: [paketInstance: paketInstance])
		}
	}
}
