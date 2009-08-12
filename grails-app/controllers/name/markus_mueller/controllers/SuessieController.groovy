package name.markus_mueller.controllers

import name.markus_mueller.domain.Suessie
import name.markus_mueller.domain.ArchiveSupply

class SuessieController
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
		[suessieInstanceList: Suessie.list(params), suessieInstanceTotal: Suessie.count()]
	}

	def show =
	{
		def suessieInstance = Suessie.get(params.id)

		if (!suessieInstance)
		{
			flash.message = "Suessie not found with id ${params.id}"
			redirect(action: list)
		}
		else
		{
			return [suessieInstance: suessieInstance]
		}
	}

	def delete =
	{
		def suessieInstance = Suessie.get(params.id)
		if (suessieInstance)
		{
			try
			{
				suessieInstance.delete(flush: true)
				flash.message = "Suessie ${params.id} deleted"
				redirect(action: list)
			}
			catch (org.springframework.dao.DataIntegrityViolationException e)
			{
				flash.message = "Suessie ${params.id} could not be deleted"
				redirect(action: show, id: params.id)
			}
		}
		else
		{
			flash.message = "Suessie not found with id ${params.id}"
			redirect(action: list)
		}
	}

	def edit =
	{
		def suessieInstance = Suessie.get(params.id)

		if (!suessieInstance)
		{
			flash.message = "Suessie not found with id ${params.id}"
			redirect(action: list)
		}
		else
		{
			return [suessieInstance: suessieInstance]
		}
	}

	def update =
	{
		def suessieInstance = Suessie.get(params.id)
		if (suessieInstance)
		{
			if (params.version)
			{
				def version = params.version.toLong()
				if (suessieInstance.version > version)
				{

					suessieInstance.errors.rejectValue("version", "suessie.optimistic.locking.failure", "Another user has updated this Suessie while you were editing.")
					render(view: 'edit', model: [suessieInstance: suessieInstance])
					return
				}
			}
			suessieInstance.properties = params
			if (!suessieInstance.hasErrors() && suessieInstance.save())
			{
				flash.message = "Suessie ${params.id} updated"
				redirect(action: show, id: suessieInstance.id)
			}
			else
			{
				render(view: 'edit', model: [suessieInstance: suessieInstance])
			}
		}
		else
		{
			flash.message = "Suessie not found with id ${params.id}"
			redirect(action: list)
		}
	}

	def create =
	{
		def suessieInstance = new Suessie()
		suessieInstance.properties = params
		return ['suessieInstance': suessieInstance]
	}

	def save =
	{
		def suessieInstance = new Suessie(params)
		def archiveEntityInstance = new ArchiveSupply(params)

		if (!suessieInstance.hasErrors() && suessieInstance.save() && !archiveEntityInstance.hasErrors() && archiveEntityInstance.save())
		{
			flash.message = "Suessie ${suessieInstance.id} created"
			redirect(action: show, id: suessieInstance.id)
		}
		else
		{
			render(view: 'create', model: [suessieInstance: suessieInstance])
		}
	}
}
